import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_client/pos_client.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';

class EmployeeStatsWidget extends StatelessWidget {
  final List<EmployeeStats> topEmployees;
  final int totalEmployees;

  const EmployeeStatsWidget({
    super.key,
    required this.topEmployees,
    required this.totalEmployees,
  });

  @override
  Widget build(BuildContext context) {
    if (topEmployees.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxRevenue = topEmployees
        .map((e) => e.totalRevenue)
        .reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.people, size: 20, color: Colors.grey.shade700),
            const SizedBox(width: 8),
            const Text(
              'Top Performers',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$totalEmployees Employees',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: topEmployees.length > 10 ? 10 : topEmployees.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final employee = topEmployees[index];
            final percentage = maxRevenue > 0
                ? (employee.totalRevenue / maxRevenue)
                : 0.0;
            return _buildEmployeeCard(employee, index + 1, percentage);
          },
        ),
      ],
    );
  }

  Widget _buildEmployeeCard(
    EmployeeStats employee,
    int rank,
    double percentage,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: rank <= 3 ? _getRankColor(rank) : Colors.grey.shade200,
          width: rank <= 3 ? 2 : 1,
        ),
        boxShadow: rank <= 3
            ? [
                BoxShadow(
                  color: _getRankColor(rank).withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: rank <= 3
                        ? [
                            _getRankColor(rank),
                            _getRankColor(rank).withValues(alpha: 0.7),
                          ]
                        : [Colors.grey.shade400, Colors.grey.shade500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: rank <= 3
                      ? Icon(
                          _getRankIcon(rank),
                          color: Colors.white,
                          size: 24,
                        )
                      : Text(
                          '#$rank',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.employeeName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${employee.totalOrders} orders • ${employee.itemsSold} items',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.currency(
                      symbol: LocalStorage().building!.currencyCode.symbol,
                      decimalDigits: 2,
                    ).format(employee.totalRevenue),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: rank <= 3 ? _getRankColor(rank) : Colors.green,
                    ),
                  ),
                  Text(
                    'Avg: ${NumberFormat.currency(symbol: LocalStorage().building!.currencyCode.symbol, decimalDigits: 2).format(employee.averageOrderValue)}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                rank <= 3 ? _getRankColor(rank) : Colors.blue,
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.orange.shade400;
      default:
        return Colors.blue;
    }
  }

  IconData _getRankIcon(int rank) {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.military_tech;
      case 3:
        return Icons.workspace_premium;
      default:
        return Icons.person;
    }
  }
}
