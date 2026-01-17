import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:intl/intl.dart';
import '../../../extensions/status.extension.dart';

class OrderItemOverviewSheet extends StatelessWidget {
  const OrderItemOverviewSheet({
    super.key,
    required this.orderItem,
  });

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.brown.shade700,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Item Overview',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade700,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Get.back(),
                color: Colors.brown.shade700,
              ),
            ],
          ),
          const Divider(height: 24),

          /// Article Name
          _buildInfoCard(
            icon: Icons.restaurant,
            title: 'Article',
            value: orderItem.article.name.capitalize ?? 'N/A',
            color: Colors.brown,
          ),
          const SizedBox(height: 12),

          /// Item Status
          _buildInfoCard(
            icon: Icons.circle,
            title: 'Status',
            value: orderItem.itemStatus.name.capitalize ?? 'N/A',
            color: orderItem.itemStatus.color,
            valueColor: orderItem.itemStatus.color700,
          ),
          const SizedBox(height: 12),

          /// Passed By
          _buildInfoCard(
            icon: Icons.person_add,
            title: 'Passed By',
            value: orderItem.passedBy?.fullName ?? 'N/A',
            subtitle: _formatDateTime(orderItem.createdAt),
            color: Colors.blue,
          ),
          const SizedBox(height: 12),

          /// Prepared By
          _buildInfoCard(
            icon: Icons.restaurant_menu,
            title: 'Prepared By',
            value: orderItem.preparedBy?.fullName ?? 'Not prepared yet',
            subtitle: orderItem.preaparedAt != null
                ? _formatDateTime(orderItem.preaparedAt!)
                : null,
            color: Colors.orange,
          ),
          const SizedBox(height: 12),

          /// Paid To
          _buildInfoCard(
            icon: Icons.payment,
            title: 'Paid To',
            value: orderItem.payedTo?.fullName ?? 'Not paid yet',
            subtitle: orderItem.payedAt != null
                ? _formatDateTime(orderItem.payedAt!)
                : null,
            color: Colors.green,
          ),
          const SizedBox(height: 20),

          /// Close Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    String? subtitle,
    required Color color,
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color is MaterialColor ? color.shade700 : color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: valueColor ?? Colors.black87,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy • hh:mm a').format(dateTime);
  }
}
