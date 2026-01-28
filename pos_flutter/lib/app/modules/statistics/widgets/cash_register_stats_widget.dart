import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_client/pos_client.dart';

class CashRegisterStatsWidget extends StatelessWidget {
  final List<CashRegisterSummary> cashRegisters;
  final int activeCashRegisters;
  final int totalCashRegisters;
  final CashRegisterSummary? bestPerforming;
  final CashRegisterSummary? worstPerforming;

  const CashRegisterStatsWidget({
    super.key,
    required this.cashRegisters,
    required this.activeCashRegisters,
    required this.totalCashRegisters,
    this.bestPerforming,
    this.worstPerforming,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                title: 'Active',
                value: activeCashRegisters.toString(),
                icon: Icons.point_of_sale,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                title: 'Total',
                value: totalCashRegisters.toString(),
                icon: Icons.store,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (bestPerforming != null) ...[
          _buildPerformanceCard(
            title: 'Best Performer',
            cashRegister: bestPerforming!,
            color: Colors.green,
            icon: Icons.trending_up,
          ),
          const SizedBox(height: 12),
        ],
        if (cashRegisters.isNotEmpty) ...[
          const Text(
            'All Cash Registers',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cashRegisters.length > 5 ? 5 : cashRegisters.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final cr = cashRegisters[index];
              return _buildCashRegisterItem(cr);
            },
          ),
        ],
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard({
    required String title,
    required CashRegisterSummary cashRegister,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  NumberFormat.currency(
                    symbol: '\$',
                    decimalDigits: 2,
                  ).format(cashRegister.totalRevenue),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${cashRegister.totalOrders} orders • ${cashRegister.totalItemsSold} items',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCashRegisterItem(CashRegisterSummary cr) {
    final startTime = DateFormat(
      'MMM dd, HH:mm',
    ).format(cr.startTime.toLocal());
    final endTime = cr.endTime != null
        ? DateFormat('MMM dd, HH:mm').format(cr.endTime!.toLocal())
        : 'Active';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: cr.isClosed ? Colors.grey.shade300 : Colors.green.shade300,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: cr.isClosed ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        symbol: '\$',
                        decimalDigits: 2,
                      ).format(cr.totalRevenue),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: cr.isClosed
                            ? Colors.grey.shade100
                            : Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        cr.isClosed ? 'Closed' : 'Active',
                        style: TextStyle(
                          fontSize: 10,
                          color: cr.isClosed ? Colors.grey : Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '$startTime → $endTime',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${cr.totalOrders} orders • Avg: ${NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(cr.averageOrderValue)}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
