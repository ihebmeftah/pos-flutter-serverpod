import 'package:serverpod/serverpod.dart' hide Order;
import 'package:pos_server/src/generated/protocol.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class StatsEndpoint extends Endpoint {
  /// Compute stats from paid orders
  Future<Stats> getStats(Session session, UuidValue buildingId) async {
    // Count totals
    final totalOrders = await Order.db.count(
      session,
      where: (t) => t.btable.buildingId.equals(buildingId),
    );
    final totalArticles = await Article.db.count(
      session,
      where: (t) => t.categorie.buildingId.equals(buildingId),
    );
    final totalCategories = await Categorie.db.count(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );

    // Get all paid orders with their items
    final paidOrders = await Order.db.find(
      session,
      where: (t) =>
          t.status.equals(OrderStatus.payed) &
          t.btable.buildingId.equals(buildingId),
      include: Order.include(
        items: OrderItem.includeList(),
      ),
    );

    // Maps to track article and category counts
    final articleMap = <String, ArticleCount>{};
    final categoryMap = <String, CategoryCount>{};

    double totalSales = 0;
    int totalItemsSold = 0;

    // Process each paid order
    for (final order in paidOrders) {
      final items = order.items;
      if (items == null) continue;

      for (final item in items) {
        // Only count items with payed status
        if (item.itemStatus != OrderItemStatus.payed) continue;

        final article = item.article;
        final articleId = article.id.toString();

        // Count article occurrences
        if (articleMap.containsKey(articleId)) {
          articleMap[articleId]!.count++;
        } else {
          articleMap[articleId] = ArticleCount(article: article, count: 1);
        }

        // Count category occurrences if category is populated
        final category = article.categorie;
        if (category != null) {
          final categoryId = category.id.toString();
          if (categoryMap.containsKey(categoryId)) {
            categoryMap[categoryId]!.count++;
          } else {
            categoryMap[categoryId] = CategoryCount(
              category: category,
              count: 1,
            );
          }
        }

        // Calculate funds
        totalSales += article.price;
        totalItemsSold++;
      }
    }

    // Get most popular articles (top 5)
    final mostPopularArticles = articleMap.values.toList()
      ..sort((a, b) => b.count.compareTo(a.count));
    final topArticles = mostPopularArticles
        .take(5)
        .map(
          (v) => ArticleCount(
            article: v.article,
            count: v.count,
          ),
        )
        .toList();

    // Get most popular categories (top 5)
    final mostPopularCategories = categoryMap.values.toList()
      ..sort((a, b) => b.count.compareTo(a.count));
    final topCategories = mostPopularCategories
        .take(5)
        .map(
          (v) => CategoryCount(
            category: v.category,
            count: v.count,
          ),
        )
        .toList();

    // Calculate averages
    final paidOrdersCount = paidOrders.length;
    final avgOrderValue = paidOrdersCount > 0
        ? totalSales / paidOrdersCount
        : 0.0;

    return Stats(
      totalOrders: totalOrders,
      totalArticles: totalArticles,
      totalCategories: totalCategories,
      paidOrdersCount: paidOrdersCount,
      totalItemsSold: totalItemsSold,
      mostPopularArticles: topArticles,
      mostPopularCategories: topCategories,
      funds: Funds(
        totalSales: totalSales,
        avgOrderValue: avgOrderValue,
      ),
    );
  }

  /// Get detailed statistics for a specific cash register
  Future<CashRegisterStats> getCashRegisterStats(
    Session session,
    UuidValue cashRegisterId,
  ) async {
    // Get the cash register
    final cashRegister = await CashRegister.db.findById(
      session,
      cashRegisterId,
    );
    if (cashRegister == null) {
      throw Exception('Cash register not found');
    }

    // Get all orders for this cash register
    final orders = await Order.db.find(
      session,
      where: (t) => t.cashRegisterId.equals(cashRegisterId),
      include: Order.include(
        items: OrderItem.includeList(),
        passedBy: UserProfile.include(),
      ),
    );

    // Collect all unique article IDs to fetch with categories
    final articleIds = <UuidValue>{};
    for (final order in orders) {
      final items = order.items;
      if (items != null) {
        for (final item in items) {
          articleIds.add(item.article.id);
        }
      }
    }

    // Fetch all articles with categories
    final articlesMap = <String, Article>{};
    if (articleIds.isNotEmpty) {
      final articles = await Article.db.find(
        session,
        where: (t) => t.id.inSet(articleIds),
        include: Article.include(
          categorie: Categorie.include(),
        ),
      );
      for (final article in articles) {
        articlesMap[article.id.toString()] = article;
      }
    }

    // Initialize counters
    double totalRevenue = 0.0;
    int totalOrders = orders.length;
    int completedOrders = 0;
    int cancelledOrders = 0;
    int totalItemsSold = 0;
    int totalItemsCancelled = 0;

    // Maps for tracking
    final articleMap = <String, ArticleCount>{};
    final categoryMap = <String, CategoryCount>{};
    final categoryRevenueMap = <String, CategoryRevenueData>{};
    final hourlyRevenueMap = <int, HourlyRevenueData>{};
    final employeeMap = <String, EmployeeStatsData>{};

    // Process each order
    for (final order in orders) {
      final items = order.items;
      if (items == null) continue;

      // Track order status
      if (order.status == OrderStatus.payed) {
        completedOrders++;
      } else if (order.status == OrderStatus.cancelled) {
        cancelledOrders++;
      }

      // Get hour from order creation
      final hour = order.createdAt.hour;
      if (!hourlyRevenueMap.containsKey(hour)) {
        hourlyRevenueMap[hour] = HourlyRevenueData();
      }

      // Process employee stats
      final passedBy = order.passedBy;
      if (passedBy != null) {
        final employeeId = passedBy.id.toString();
        if (!employeeMap.containsKey(employeeId)) {
          employeeMap[employeeId] = EmployeeStatsData(
            employeeId: passedBy.id!,
            employeeName: passedBy.fullName ?? 'Unknown',
          );
        }
      }

      for (final item in items) {
        final articleId = item.article.id.toString();
        // Get the full article with category
        final article = articlesMap[articleId] ?? item.article;
        final category = article.categorie;

        // Only count paid items for revenue
        if (item.itemStatus == OrderItemStatus.payed) {
          final itemRevenue = article.price;
          totalRevenue += itemRevenue;
          totalItemsSold++;

          // Track article counts
          if (articleMap.containsKey(articleId)) {
            articleMap[articleId]!.count++;
          } else {
            articleMap[articleId] = ArticleCount(article: article, count: 1);
          }

          // Track category data
          if (category != null) {
            final categoryId = category.id.toString();

            // Category counts for top selling
            if (categoryMap.containsKey(categoryId)) {
              categoryMap[categoryId]!.count++;
            } else {
              categoryMap[categoryId] = CategoryCount(
                category: category,
                count: 1,
              );
            }

            // Category revenue
            if (!categoryRevenueMap.containsKey(categoryId)) {
              categoryRevenueMap[categoryId] = CategoryRevenueData(
                category: category,
                orderIds: [],
              );
            }
            categoryRevenueMap[categoryId]!.revenue += itemRevenue;
            categoryRevenueMap[categoryId]!.itemsSold++;
            if (!categoryRevenueMap[categoryId]!.orderIds.contains(
              order.id.toString(),
            )) {
              categoryRevenueMap[categoryId]!.orderIds.add(order.id.toString());
            }
          }

          // Hourly revenue
          hourlyRevenueMap[hour]!.revenue += itemRevenue;
          hourlyRevenueMap[hour]!.itemsSold++;

          // Employee stats
          if (passedBy != null) {
            final employeeId = passedBy.id.toString();
            employeeMap[employeeId]!.revenue += itemRevenue;
            employeeMap[employeeId]!.itemsSold++;
          }
        } else if (item.itemStatus == OrderItemStatus.cancelled) {
          totalItemsCancelled++;
        }
      }

      // Track order count per hour
      hourlyRevenueMap[hour]!.orderCount++;

      // Track employee order count
      if (passedBy != null) {
        final employeeId = passedBy.id.toString();
        employeeMap[employeeId]!.orderCount++;
      }
    }

    // Calculate averages
    final averageOrderValue = completedOrders > 0
        ? totalRevenue / completedOrders
        : 0.0;

    // Get top selling articles (top 10)
    final topArticles =
        (articleMap.values.toList()..sort((a, b) => b.count.compareTo(a.count)))
            .take(10)
            .toList();

    // Get top selling categories (top 10)
    final topCategories =
        (categoryMap.values.toList()
              ..sort((a, b) => b.count.compareTo(a.count)))
            .take(10)
            .toList();

    // Build category revenue list with percentages
    final categoryRevenue = categoryRevenueMap.entries.map((entry) {
      final data = entry.value;
      final percentage = totalRevenue > 0
          ? (data.revenue / totalRevenue) * 100
          : 0.0;
      return CategoryRevenue(
        category: data.category,
        totalRevenue: data.revenue,
        itemsSold: data.itemsSold,
        orderCount: data.orderIds.length,
        percentageOfTotal: percentage,
      );
    }).toList()..sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue));

    // Build hourly revenue list
    final hourlyRevenue = hourlyRevenueMap.entries.map((entry) {
      return HourlyRevenue(
        hour: entry.key,
        revenue: entry.value.revenue,
        orderCount: entry.value.orderCount,
        itemsSold: entry.value.itemsSold,
      );
    }).toList()..sort((a, b) => a.hour.compareTo(b.hour));

    // Find peak hour
    String? peakHour;
    if (hourlyRevenue.isNotEmpty) {
      final peak = hourlyRevenue.reduce(
        (a, b) => a.revenue > b.revenue ? a : b,
      );
      peakHour = '${peak.hour}:00 - ${peak.hour + 1}:00';
    }

    // Build employee stats list
    final employeeStats = employeeMap.values.map((data) {
      final avgOrderValue = data.orderCount > 0
          ? data.revenue / data.orderCount
          : 0.0;
      return EmployeeStats(
        employeeId: data.employeeId,
        employeeName: data.employeeName,
        totalOrders: data.orderCount,
        totalRevenue: data.revenue,
        averageOrderValue: avgOrderValue,
        itemsSold: data.itemsSold,
      );
    }).toList()..sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue));

    // Calculate cash difference
    final startAmt = cashRegister.startAmount ?? 0.0;
    final endAmt = cashRegister.endAmount ?? 0.0;
    final expectedEndAmount = startAmt + totalRevenue;
    final cashDifference = endAmt - expectedEndAmount;

    return CashRegisterStats(
      cashRegisterId: cashRegisterId,
      startTime: cashRegister.start,
      endTime: cashRegister.end,
      isClosed: cashRegister.isClosed,
      totalRevenue: totalRevenue,
      startAmount: startAmt,
      endAmount: endAmt,
      expectedEndAmount: expectedEndAmount,
      cashDifference: cashDifference,
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      cancelledOrders: cancelledOrders,
      averageOrderValue: averageOrderValue,
      totalItemsSold: totalItemsSold,
      totalItemsCancelled: totalItemsCancelled,
      topSellingArticles: topArticles,
      topSellingCategories: topCategories,
      revenueByCategory: categoryRevenue,
      hourlyRevenue: hourlyRevenue,
      peakHour: peakHour,
      employeeStats: employeeStats.isNotEmpty ? employeeStats : null,
    );
  }

  /// Get comprehensive detailed statistics for a building
  Future<BuildingDetailedStats> getBuildingDetailedStats(
    Session session,
    UuidValue buildingId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    // Get building info
    final building = await Building.db.findById(session, buildingId);

    // Get all cash registers for this building
    final allCashRegisters = await CashRegister.db.find(
      session,
      where: (t) => t.buildingId.equals(buildingId),
    );

    // Filter cash registers by date if provided
    final cashRegisters = allCashRegisters.where((cr) {
      if (startDate != null && cr.start.isBefore(startDate)) return false;
      if (endDate != null && cr.start.isAfter(endDate)) return false;
      return true;
    }).toList();

    // Get all orders for this building with date filtering
    var orderQuery = Order.db.find(
      session,
      where: (t) => t.btable.buildingId.equals(buildingId),
      include: Order.include(
        items: OrderItem.includeList(),
        passedBy: UserProfile.include(),
        cashRegister: CashRegister.include(),
      ),
    );

    final allOrders = await orderQuery;

    // Filter orders by date
    final orders = allOrders.where((order) {
      if (startDate != null && order.createdAt.isBefore(startDate)) {
        return false;
      }
      if (endDate != null && order.createdAt.isAfter(endDate)) return false;
      return true;
    }).toList();

    // Collect all unique article IDs to fetch with categories
    final articleIds = <UuidValue>{};
    for (final order in orders) {
      final items = order.items;
      if (items != null) {
        for (final item in items) {
          articleIds.add(item.article.id);
        }
      }
    }

    // Fetch all articles with categories
    final articlesMap = <String, Article>{};
    if (articleIds.isNotEmpty) {
      final articles = await Article.db.find(
        session,
        where: (t) => t.id.inSet(articleIds),
        include: Article.include(
          categorie: Categorie.include(),
        ),
      );
      for (final article in articles) {
        articlesMap[article.id.toString()] = article;
      }
    }

    // Initialize counters
    double totalRevenue = 0.0;
    int totalOrders = orders.length;
    int totalItemsSold = 0;

    // Maps for tracking
    final articleMap = <String, ArticleCount>{};
    final categoryMap = <String, CategoryCount>{};
    final categoryRevenueMap = <String, CategoryRevenueData>{};
    final hourlyRevenueMap = <int, HourlyRevenueData>{};
    final dailyRevenueMap = <String, DailyRevenueData>{};
    final employeeMap = <String, EmployeeStatsData>{};
    final cashRegisterStatsMap = <String, CashRegisterStatsData>{};

    // Initialize cash register stats
    for (final cr in cashRegisters) {
      final crId = cr.id.toString();
      cashRegisterStatsMap[crId] = CashRegisterStatsData(
        cashRegisterId: cr.id,
        startTime: cr.start,
        endTime: cr.end,
        isClosed: cr.isClosed,
      );
    }

    // Process each order
    for (final order in orders) {
      final items = order.items;
      if (items == null) continue;

      // Get hour from order creation
      final hour = order.createdAt.hour;
      if (!hourlyRevenueMap.containsKey(hour)) {
        hourlyRevenueMap[hour] = HourlyRevenueData();
      }

      // Get date (normalized to start of day)
      final dateKey = DateTime(
        order.createdAt.year,
        order.createdAt.month,
        order.createdAt.day,
      ).toIso8601String();
      if (!dailyRevenueMap.containsKey(dateKey)) {
        dailyRevenueMap[dateKey] = DailyRevenueData();
      }

      // Process employee stats
      final passedBy = order.passedBy;
      if (passedBy != null) {
        final employeeId = passedBy.id.toString();
        if (!employeeMap.containsKey(employeeId)) {
          employeeMap[employeeId] = EmployeeStatsData(
            employeeId: passedBy.id!,
            employeeName: passedBy.fullName ?? 'Unknown',
          );
        }
      }

      // Track cash register for this order
      final cashRegisterId = order.cashRegisterId?.toString();

      for (final item in items) {
        // Only count paid items
        if (item.itemStatus != OrderItemStatus.payed) continue;

        final articleId = item.article.id.toString();
        // Get the full article with category
        final article = articlesMap[articleId] ?? item.article;
        final category = article.categorie;
        final itemRevenue = article.price;

        totalRevenue += itemRevenue;
        totalItemsSold++;

        // Track article counts
        if (articleMap.containsKey(articleId)) {
          articleMap[articleId]!.count++;
        } else {
          articleMap[articleId] = ArticleCount(article: article, count: 1);
        }

        // Track category data
        if (category != null) {
          final categoryId = category.id.toString();

          // Category counts
          if (categoryMap.containsKey(categoryId)) {
            categoryMap[categoryId]!.count++;
          } else {
            categoryMap[categoryId] = CategoryCount(
              category: category,
              count: 1,
            );
          }

          // Category revenue
          if (!categoryRevenueMap.containsKey(categoryId)) {
            categoryRevenueMap[categoryId] = CategoryRevenueData(
              category: category,
              orderIds: [],
            );
          }
          categoryRevenueMap[categoryId]!.revenue += itemRevenue;
          categoryRevenueMap[categoryId]!.itemsSold++;
          if (!categoryRevenueMap[categoryId]!.orderIds.contains(
            order.id.toString(),
          )) {
            categoryRevenueMap[categoryId]!.orderIds.add(order.id.toString());
          }
        }

        // Hourly revenue
        hourlyRevenueMap[hour]!.revenue += itemRevenue;
        hourlyRevenueMap[hour]!.itemsSold++;

        // Daily revenue
        dailyRevenueMap[dateKey]!.revenue += itemRevenue;
        dailyRevenueMap[dateKey]!.itemsSold++;

        // Employee stats
        if (passedBy != null) {
          final employeeId = passedBy.id.toString();
          employeeMap[employeeId]!.revenue += itemRevenue;
          employeeMap[employeeId]!.itemsSold++;
        }

        // Cash register stats
        if (cashRegisterId != null &&
            cashRegisterStatsMap.containsKey(cashRegisterId)) {
          cashRegisterStatsMap[cashRegisterId]!.revenue += itemRevenue;
          cashRegisterStatsMap[cashRegisterId]!.itemsSold++;
        }
      }

      // Track order counts
      hourlyRevenueMap[hour]!.orderCount++;
      dailyRevenueMap[dateKey]!.orderCount++;

      if (passedBy != null) {
        final employeeId = passedBy.id.toString();
        employeeMap[employeeId]!.orderCount++;
      }

      if (cashRegisterId != null &&
          cashRegisterStatsMap.containsKey(cashRegisterId)) {
        cashRegisterStatsMap[cashRegisterId]!.orderCount++;
      }
    }

    // Calculate average order value
    final paidOrders = orders
        .where((o) => o.status == OrderStatus.payed)
        .length;
    final averageOrderValue = paidOrders > 0 ? totalRevenue / paidOrders : 0.0;

    // Get top selling articles (top 15)
    final topArticles =
        (articleMap.values.toList()..sort((a, b) => b.count.compareTo(a.count)))
            .take(15)
            .toList();

    // Get top selling categories (top 10)
    final topCategories =
        (categoryMap.values.toList()
              ..sort((a, b) => b.count.compareTo(a.count)))
            .take(10)
            .toList();

    // Build category revenue list with percentages
    final categoryRevenue = categoryRevenueMap.entries.map((entry) {
      final data = entry.value;
      final percentage = totalRevenue > 0
          ? (data.revenue / totalRevenue) * 100
          : 0.0;
      return CategoryRevenue(
        category: data.category,
        totalRevenue: data.revenue,
        itemsSold: data.itemsSold,
        orderCount: data.orderIds.length,
        percentageOfTotal: percentage,
      );
    }).toList()..sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue));

    // Build hourly distribution
    final hourlyDistribution = hourlyRevenueMap.entries.map((entry) {
      return HourlyRevenue(
        hour: entry.key,
        revenue: entry.value.revenue,
        orderCount: entry.value.orderCount,
        itemsSold: entry.value.itemsSold,
      );
    }).toList()..sort((a, b) => a.hour.compareTo(b.hour));

    // Build daily revenue
    final dailyRevenue = dailyRevenueMap.entries.map((entry) {
      return DailyRevenue(
        date: DateTime.parse(entry.key),
        revenue: entry.value.revenue,
        orderCount: entry.value.orderCount,
        itemsSold: entry.value.itemsSold,
      );
    }).toList()..sort((a, b) => a.date.compareTo(b.date));

    // Build top employees (top 10)
    final topEmployees =
        (employeeMap.values.map((data) {
                final avgOrderValue = data.orderCount > 0
                    ? data.revenue / data.orderCount
                    : 0.0;
                return EmployeeStats(
                  employeeId: data.employeeId,
                  employeeName: data.employeeName,
                  totalOrders: data.orderCount,
                  totalRevenue: data.revenue,
                  averageOrderValue: avgOrderValue,
                  itemsSold: data.itemsSold,
                );
              }).toList()
              ..sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue)))
            .take(10)
            .toList();

    // Build cash register summaries
    final cashRegisterStats = cashRegisterStatsMap.values.map((data) {
      final avgOrderValue = data.orderCount > 0
          ? data.revenue / data.orderCount
          : 0.0;
      return CashRegisterSummary(
        cashRegisterId: data.cashRegisterId,
        startTime: data.startTime,
        endTime: data.endTime,
        isClosed: data.isClosed,
        totalRevenue: data.revenue,
        totalOrders: data.orderCount,
        totalItemsSold: data.itemsSold,
        averageOrderValue: avgOrderValue,
      );
    }).toList()..sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue));

    // Find best and worst performing cash registers
    CashRegisterSummary? bestPerforming;
    CashRegisterSummary? worstPerforming;
    if (cashRegisterStats.isNotEmpty) {
      bestPerforming = cashRegisterStats.first;
      worstPerforming = cashRegisterStats.last;
    }

    // Count active cash registers (not closed)
    final activeCashRegisters = cashRegisters
        .where((cr) => !cr.isClosed)
        .length;

    // Calculate average revenue per cash register
    final avgRevenuePerCashRegister = cashRegisterStats.isNotEmpty
        ? totalRevenue / cashRegisterStats.length
        : 0.0;

    return BuildingDetailedStats(
      buildingId: buildingId,
      buildingName: building?.name,
      totalRevenue: totalRevenue,
      totalOrders: totalOrders,
      averageOrderValue: averageOrderValue,
      cashRegisterStats: cashRegisterStats,
      activeCashRegisters: activeCashRegisters,
      totalCashRegisters: cashRegisters.length,
      totalItemsSold: totalItemsSold,
      topSellingArticles: topArticles,
      topSellingCategories: topCategories,
      revenueByCategory: categoryRevenue,
      dailyRevenue: dailyRevenue,
      hourlyDistribution: hourlyDistribution,
      topEmployees: topEmployees,
      totalEmployees: employeeMap.length,
      avgRevenuePerCashRegister: avgRevenuePerCashRegister,
      bestPerformingCashRegister: bestPerforming,
      worstPerformingCashRegister: worstPerforming,
    );
  }
}
