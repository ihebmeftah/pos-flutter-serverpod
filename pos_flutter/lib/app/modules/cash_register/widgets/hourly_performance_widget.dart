import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_client/pos_client.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';

class HourlyPerformanceWidget extends StatelessWidget {
  final List<HourlyRevenue> hourlyRevenue;
  final String? peakHour;

  const HourlyPerformanceWidget({
    super.key,
    required this.hourlyRevenue,
    this.peakHour,
  });

  @override
  Widget build(BuildContext context) {
    if (hourlyRevenue.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'No hourly data available',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    final maxRevenue = hourlyRevenue
        .map((e) => e.revenue)
        .reduce((a, b) => a > b ? a : b);

    // Sort by hour
    final sortedHourly = List<HourlyRevenue>.from(hourlyRevenue)
      ..sort((a, b) => a.hour.compareTo(b.hour));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (peakHour != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber.shade400, Colors.orange.shade500],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Peak Hour',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      peakHour!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        const Text(
          'Hourly Revenue Distribution',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
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
            children: sortedHourly.map((hour) {
              final percentage = maxRevenue > 0
                  ? (hour.revenue / maxRevenue)
                  : 0.0;
              final isPeak =
                  peakHour != null &&
                  peakHour!.contains(
                    '${hour.hour.toString().padLeft(2, '0')}:',
                  );

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: _buildHourRow(hour, percentage, isPeak),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildHourRow(HourlyRevenue hour, double percentage, bool isPeak) {
    return Row(
      children: [
        Container(
          width: isPeak ? 70 : 60,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
            color: isPeak ? Colors.amber.shade100 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isPeak) ...[
                Icon(Icons.star, size: 11, color: Colors.amber.shade700),
                const SizedBox(width: 3),
              ],
              Flexible(
                child: Text(
                  '${hour.hour.toString().padLeft(2, '0')}:00',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isPeak ? FontWeight.bold : FontWeight.w600,
                    color: isPeak
                        ? Colors.amber.shade900
                        : Colors.grey.shade700,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isPeak
                          ? [Colors.amber.shade400, Colors.orange.shade500]
                          : [Colors.blue.shade400, Colors.blue.shade600],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 8),
                  child: percentage > 0.25
                      ? Text(
                          NumberFormat.currency(
                            symbol:
                                LocalStorage().building!.currencyCode.symbol,
                            decimalDigits: 0,
                          ).format(hour.revenue),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (percentage <= 0.25)
                Text(
                  NumberFormat.currency(
                    symbol: LocalStorage().building!.currencyCode.symbol,
                    decimalDigits: 0,
                  ).format(hour.revenue),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              Text(
                '${hour.orderCount} ${hour.orderCount == 1 ? 'order' : 'orders'}',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
