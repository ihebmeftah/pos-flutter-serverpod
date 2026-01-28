import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_client/pos_client.dart';

class RevenueChartWidget extends StatelessWidget {
  final List<DailyRevenue>? dailyRevenue;
  final List<HourlyRevenue>? hourlyRevenue;

  const RevenueChartWidget({
    super.key,
    this.dailyRevenue,
    this.hourlyRevenue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (dailyRevenue != null && dailyRevenue!.isNotEmpty) ...[
          _buildSectionHeader('Daily Revenue', Icons.show_chart),
          const SizedBox(height: 12),
          _buildDailyRevenueChart(),
          const SizedBox(height: 24),
        ],
        if (hourlyRevenue != null && hourlyRevenue!.isNotEmpty) ...[
          _buildSectionHeader('Hourly Distribution', Icons.access_time),
          const SizedBox(height: 12),
          _buildHourlyRevenueChart(),
        ],
      ],
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade700),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDailyRevenueChart() {
    if (dailyRevenue == null || dailyRevenue!.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxRevenue = dailyRevenue!
        .map((e) => e.revenue)
        .reduce((a, b) => a > b ? a : b);

    return Container(
      height: 250,
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dailyRevenue!.length,
              itemBuilder: (context, index) {
                final day = dailyRevenue![index];
                final percentage = maxRevenue > 0
                    ? (day.revenue / maxRevenue)
                    : 0.0;

                return Container(
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '\$${day.revenue.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            heightFactor: percentage,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade400,
                                    Colors.blue.shade600,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        DateFormat('MMM dd').format(day.date.toLocal()),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '${day.orderCount}',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyRevenueChart() {
    if (hourlyRevenue == null || hourlyRevenue!.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxRevenue = hourlyRevenue!
        .map((e) => e.revenue)
        .reduce((a, b) => a > b ? a : b);

    // Sort by hour
    final sortedHourly = List<HourlyRevenue>.from(hourlyRevenue!)
      ..sort((a, b) => a.hour.compareTo(b.hour));

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
        children: [
          ...sortedHourly.map((hour) {
            final percentage = maxRevenue > 0
                ? (hour.revenue / maxRevenue)
                : 0.0;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      '${hour.hour.toString().padLeft(2, '0')}:00',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: percentage,
                          child: Container(
                            height: 24,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.shade400,
                                  Colors.green.shade600,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 8),
                            child: percentage > 0.3
                                ? Text(
                                    '\$${hour.revenue.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontSize: 10,
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
                    width: 60,
                    child: Text(
                      percentage < 0.3
                          ? '\$${hour.revenue.toStringAsFixed(0)}'
                          : '${hour.orderCount} orders',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
