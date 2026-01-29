import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';

class OrderStatisticsWidget extends StatelessWidget {
  final int totalOrders;
  final int completedOrders;
  final int cancelledOrders;
  final double averageOrderValue;
  final int totalItemsSold;
  final int totalItemsCancelled;

  const OrderStatisticsWidget({
    super.key,
    required this.totalOrders,
    required this.completedOrders,
    required this.cancelledOrders,
    required this.averageOrderValue,
    required this.totalItemsSold,
    required this.totalItemsCancelled,
  });

  @override
  Widget build(BuildContext context) {
    final completionRate = totalOrders > 0
        ? (completedOrders / totalOrders * 100)
        : 0.0;
    final cancellationRate = totalOrders > 0
        ? (cancelledOrders / totalOrders * 100)
        : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Overview Cards
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Total Orders',
                value: totalOrders.toString(),
                icon: Icons.receipt_long,
                color: Colors.blue,
                gradient: [Colors.blue.shade400, Colors.blue.shade600],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                title: 'Avg Order',
                value: NumberFormat.currency(
                  symbol: LocalStorage().building!.currencyCode.symbol,
                  decimalDigits: 2,
                ).format(averageOrderValue),
                icon: Icons.analytics,
                color: Colors.orange,
                gradient: [Colors.orange.shade400, Colors.orange.shade600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Completion & Cancellation Stats
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              _buildOrderStatusRow(
                label: 'Completed',
                count: completedOrders,
                percentage: completionRate,
                color: Colors.green,
                icon: Icons.check_circle,
              ),
              const SizedBox(height: 16),
              _buildOrderStatusRow(
                label: 'Cancelled',
                count: cancelledOrders,
                percentage: cancellationRate,
                color: Colors.red,
                icon: Icons.cancel,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Items Statistics
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade50, Colors.purple.shade100],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.purple.shade200,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildItemStat(
                  label: 'Items Sold',
                  count: totalItemsSold,
                  icon: Icons.shopping_cart,
                  color: Colors.purple,
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: Colors.purple.shade200,
              ),
              Expanded(
                child: _buildItemStat(
                  label: 'Items Cancelled',
                  count: totalItemsCancelled,
                  icon: Icons.remove_shopping_cart,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required List<Color> gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatusRow({
    required String label,
    required int count,
    required double percentage,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${percentage.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItemStat({
    required String label,
    required int count,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
