import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/cash_register_stats_controller.dart';
import '../widgets/cash_register_financial_widget.dart';
import '../widgets/order_statistics_widget.dart';
import '../widgets/hourly_performance_widget.dart';
import '../../../components/app_section_card.dart';
import '../../statistics/widgets/top_items_widget.dart';
import '../../statistics/widgets/employee_stats_widget.dart';

class CashRegisterStatsView extends GetView<CashRegisterStatsController> {
  const CashRegisterStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash Register Statistics'),
        centerTitle: true,
        actions: [
          Obx(
            () => controller.isRefreshing.value
                ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: controller.refreshStats,
                  ),
          ),
        ],
      ),
      body: GetBuilder<CashRegisterStatsController>(
        builder: (controller) {
          return controller.obx(
            (state) => RefreshIndicator(
              onRefresh: controller.refreshStats,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSessionHeader(),
                    const SizedBox(height: 16),
                    CashRegisterFinancialWidget(
                      totalRevenue: controller.cashRegisterStats.totalRevenue,
                      startAmount: controller.cashRegisterStats.startAmount,
                      endAmount: controller.cashRegisterStats.endAmount,
                      expectedEndAmount:
                          controller.cashRegisterStats.expectedEndAmount,
                      cashDifference:
                          controller.cashRegisterStats.cashDifference,
                      isClosed: controller.cashRegisterStats.isClosed,
                    ),
                    const SizedBox(height: 24),
                    AppSectionCard(
                      title: 'Order Statistics',
                      icon: Icons.receipt_long,
                      child: OrderStatisticsWidget(
                        totalOrders: controller.cashRegisterStats.totalOrders,
                        completedOrders:
                            controller.cashRegisterStats.completedOrders,
                        cancelledOrders:
                            controller.cashRegisterStats.cancelledOrders,
                        averageOrderValue:
                            controller.cashRegisterStats.averageOrderValue,
                        totalItemsSold:
                            controller.cashRegisterStats.totalItemsSold,
                        totalItemsCancelled:
                            controller.cashRegisterStats.totalItemsCancelled,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppSectionCard(
                      title: 'Hourly Performance',
                      icon: Icons.schedule,
                      child: HourlyPerformanceWidget(
                        hourlyRevenue:
                            controller.cashRegisterStats.hourlyRevenue,
                        peakHour: controller.cashRegisterStats.peakHour,
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (controller
                        .cashRegisterStats
                        .topSellingArticles
                        .isNotEmpty)
                      AppSectionCard(
                        title: 'Top Products & Categories',
                        icon: Icons.trending_up,
                        child: TopItemsWidget(
                          topArticles:
                              controller.cashRegisterStats.topSellingArticles,
                          topCategories:
                              controller.cashRegisterStats.topSellingCategories,
                          categoryRevenue:
                              controller.cashRegisterStats.revenueByCategory,
                        ),
                      ),
                    const SizedBox(height: 24),
                    if (controller.cashRegisterStats.employeeStats != null &&
                        controller.cashRegisterStats.employeeStats!.isNotEmpty)
                      AppSectionCard(
                        title: 'Employee Performance',
                        icon: Icons.people,
                        child: EmployeeStatsWidget(
                          topEmployees:
                              controller.cashRegisterStats.employeeStats!,
                          totalEmployees: controller
                              .cashRegisterStats
                              .employeeStats!
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            onLoading: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading cash register statistics...'),
                ],
              ),
            ),
            onError: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading statistics',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error ?? 'Unknown error',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: controller.getCashRegStats,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSessionHeader() {
    final stats = controller.cashRegisterStats;
    final startTime = DateFormat(
      'MMM dd, yyyy HH:mm',
    ).format(stats.startTime.toLocal());
    final endTime = stats.endTime != null
        ? DateFormat('MMM dd, yyyy HH:mm').format(stats.endTime!.toLocal())
        : 'Active';

    final duration = stats.endTime != null
        ? stats.endTime!.difference(stats.startTime)
        : DateTime.now().difference(stats.startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: stats.isClosed
              ? [Colors.grey.shade100, Colors.grey.shade200]
              : [Colors.blue.shade50, Colors.blue.shade100],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: stats.isClosed ? Colors.grey.shade300 : Colors.blue.shade300,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: stats.isClosed
                    ? Colors.grey.shade700
                    : Colors.blue.shade700,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Session Information',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: stats.isClosed
                      ? Colors.grey.shade700
                      : Colors.blue.shade700,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: stats.isClosed ? Colors.grey : Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  stats.isClosed ? 'CLOSED' : 'ACTIVE',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Started',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      startTime,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ended',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      endTime,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Duration: ${hours}h ${minutes}m',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
