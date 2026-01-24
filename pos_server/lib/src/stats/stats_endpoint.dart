import 'package:serverpod/serverpod.dart' hide Order;
import 'package:pos_server/src/generated/protocol.dart';

class StatsEndpoint extends Endpoint {
  /// Compute stats from paid orders
  Future<Stats> getStats(Session session) async {
    // Count totals
    final totalOrders = await Order.db.count(session);
    final totalArticles = await Article.db.count(session);
    final totalCategories = await Categorie.db.count(session);

    // Get all paid orders with their items
    final paidOrders = await Order.db.find(
      session,
      where: (t) => t.status.equals(OrderStatus.payed),
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
}
