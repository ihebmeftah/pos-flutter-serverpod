import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/statistics_controller.dart';
import '../widgets/stat_card_widget.dart';
import '../widgets/cash_register_stats_widget.dart';
import '../widgets/top_items_widget.dart';
import '../widgets/revenue_chart_widget.dart';
import '../widgets/employee_stats_widget.dart';
import '../../../components/app_section_card.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building Statistics'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showDateFilterDialog(context),
          ),
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
      body: GetBuilder<StatisticsController>(
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
                    _buildDateRangeHeader(),
                    const SizedBox(height: 16),
                    _buildOverviewCards(),
                    const SizedBox(height: 24),
                    AppSectionCard(
                      title: 'Cash Registers',
                      icon: Icons.point_of_sale,
                      child: CashRegisterStatsWidget(
                        cashRegisters:
                            controller.buildingDetailedStats.cashRegisterStats,
                        activeCashRegisters: controller
                            .buildingDetailedStats
                            .activeCashRegisters,
                        totalCashRegisters:
                            controller.buildingDetailedStats.totalCashRegisters,
                        bestPerforming: controller
                            .buildingDetailedStats
                            .bestPerformingCashRegister,
                        worstPerforming: controller
                            .buildingDetailedStats
                            .worstPerformingCashRegister,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppSectionCard(
                      title: 'Revenue Analysis',
                      icon: Icons.analytics,
                      child: RevenueChartWidget(
                        dailyRevenue:
                            controller.buildingDetailedStats.dailyRevenue,
                        hourlyRevenue:
                            controller.buildingDetailedStats.hourlyDistribution,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppSectionCard(
                      title: 'Top Products & Categories',
                      icon: Icons.trending_up,
                      child: TopItemsWidget(
                        topArticles:
                            controller.buildingDetailedStats.topSellingArticles,
                        topCategories: controller
                            .buildingDetailedStats
                            .topSellingCategories,
                        categoryRevenue:
                            controller.buildingDetailedStats.revenueByCategory,
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (controller
                        .buildingDetailedStats
                        .topEmployees
                        .isNotEmpty)
                      AppSectionCard(
                        title: 'Employee Performance',
                        icon: Icons.people,
                        child: EmployeeStatsWidget(
                          topEmployees:
                              controller.buildingDetailedStats.topEmployees,
                          totalEmployees:
                              controller.buildingDetailedStats.totalEmployees,
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
                  Text('Loading statistics...'),
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
                    onPressed: controller.getBuildingDetailsStats,
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

  Widget _buildDateRangeHeader() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.blue.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.date_range, size: 20, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${DateFormat('MMM dd, yyyy').format(controller.fromDateTime.toLocal())} - ${DateFormat('MMM dd, yyyy').format(controller.toDateTime.toLocal())}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCards() {
    final stats = controller.buildingDetailedStats;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCardWidget(
                title: 'Total Revenue',
                value: StatCardWidget.formatCurrency(stats.totalRevenue),
                icon: Icons.attach_money,
                color: Colors.green,
                subtitle: controller.buildingDetailedStats.buildingName,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCardWidget(
                title: 'Total Orders',
                value: StatCardWidget.formatNumber(stats.totalOrders),
                icon: Icons.receipt_long,
                color: Colors.blue,
                subtitle: '${stats.totalItemsSold} items sold',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCardWidget(
                title: 'Avg Order Value',
                value: StatCardWidget.formatCurrency(stats.averageOrderValue),
                icon: Icons.trending_up,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCardWidget(
                title: 'Avg/Register',
                value: StatCardWidget.formatCurrency(
                  stats.avgRevenuePerCashRegister,
                ),
                icon: Icons.point_of_sale,
                color: Colors.purple,
                subtitle: '${stats.activeCashRegisters} active',
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDateFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter by Date Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.blue),
              title: const Text('Current Month'),
              onTap: () {
                controller.setCurrentMonth();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month, color: Colors.orange),
              title: const Text('Last Month'),
              onTap: () {
                controller.setLastMonth();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.today, color: Colors.green),
              title: const Text('Last 7 Days'),
              onTap: () {
                controller.setLast7Days();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range, color: Colors.purple),
              title: const Text('Last 30 Days'),
              onTap: () {
                controller.setLast30Days();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
