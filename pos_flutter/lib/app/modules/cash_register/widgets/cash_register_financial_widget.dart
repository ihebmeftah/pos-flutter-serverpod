import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';

class CashRegisterFinancialWidget extends StatelessWidget {
  final double totalRevenue;
  final double startAmount;
  final double endAmount;
  final double expectedEndAmount;
  final double cashDifference;
  final bool isClosed;

  const CashRegisterFinancialWidget({
    super.key,
    required this.totalRevenue,
    required this.startAmount,
    required this.endAmount,
    required this.expectedEndAmount,
    required this.cashDifference,
    required this.isClosed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Revenue Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade400, Colors.green.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isClosed ? Icons.lock : Icons.lock_open,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isClosed ? 'Closed' : 'Active',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Total Revenue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage().building!.currencyCode.symbol,
                  decimalDigits: 2,
                ).format(totalRevenue),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Cash Flow Cards
        Row(
          children: [
            Expanded(
              child: _buildAmountCard(
                title: 'Start Amount',
                amount: startAmount,
                icon: Icons.play_circle_outline,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildAmountCard(
                title: 'End Amount',
                amount: endAmount,
                icon: Icons.stop_circle_outlined,
                color: Colors.purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildAmountCard(
                title: 'Expected',
                amount: expectedEndAmount,
                icon: Icons.calculate_outlined,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDifferenceCard(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountCard({
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            NumberFormat.currency(
              symbol: LocalStorage().building!.currencyCode.symbol,
              decimalDigits: 2,
            ).format(amount),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifferenceCard() {
    final isPositive = cashDifference >= 0;
    final isPerfect = cashDifference == 0;
    final color = isPerfect
        ? Colors.green
        : isPositive
        ? Colors.blue
        : Colors.red;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isPerfect
              ? [Colors.green.shade50, Colors.green.shade100]
              : isPositive
              ? [Colors.blue.shade50, Colors.blue.shade100]
              : [Colors.red.shade50, Colors.red.shade100],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isPerfect
                ? Icons.check_circle
                : isPositive
                ? Icons.arrow_upward
                : Icons.arrow_downward,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 12),
          Text(
            'Difference',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${isPositive && !isPerfect ? '+' : ''}${NumberFormat.currency(symbol: LocalStorage().building!.currencyCode.symbol, decimalDigits: 2).format(cashDifference)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
