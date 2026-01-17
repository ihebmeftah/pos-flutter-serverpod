import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../../../extensions/datetime.extension.dart';
import '../../../extensions/status.extension.dart';
import '../../../routes/app_pages.dart';

class OrderCard extends StatefulWidget {
  final Order order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _isExpanded = false;
  late final double totalPrice = widget.order.items!.fold<double>(
    0.0,
    (sum, item) => sum + item.article.price,
  );
  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final currencySymbol = LocalStorage().building!.currencyCode.symbol;

    return Card(
      color: order.status.color50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: order.status.color.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () => Get.toNamed(
          '${Routes.ORDER_DETAILS}/${order.id}',
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Information Row
              Row(
                spacing: 10,
                children: [
                  // Table Number
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: order.status.color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 5,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/table.svg",
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            order.status.color,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "№${order.btable?.number ?? 'N/A'}",
                          style: context.textTheme.titleMedium?.copyWith(
                            color: order.status.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Status Badge
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: order.status.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        order.status.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Expand Icon
                  IconButton(
                    color: order.status.color,
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ),
                ],
              ),

              // Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    '${totalPrice.toStringAsFixed(2)} $currencySymbol',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: order.status.color,
                    ),
                  ),
                ],
              ),

              // Expanded Details
              if (_isExpanded)
                Column(
                  spacing: 5,
                  children: [
                    const Divider(height: 24),

                    // Passed By
                    if (order.passedBy != null)
                      _DetailRow(
                        icon: Icons.person_add,
                        label: 'Passed by',
                        value: order.passedBy!.fullName ?? 'Unknown',
                        color: Colors.blue,
                      ),

                    // Closed By
                    if (order.closedby != null)
                      _DetailRow(
                        icon: Icons.person_off,
                        label: 'Closed by',
                        value: order.closedby!.fullName ?? 'Unknown',
                        color: Colors.orange,
                      ),

                    // Created At
                    _DetailRow(
                      icon: Icons.access_time,
                      label: 'Created at',
                      value: order.createdAt.toLongDateString,
                      color: Colors.blueGrey,
                    ),

                    // Updated At
                    if (order.updatedAt != null)
                      _DetailRow(
                        icon: Icons.update,
                        label: 'Last updated',
                        value: order.updatedAt!.toLongDateString,
                        color: Colors.green,
                      ),

                    // Items Count
                    if (order.items != null)
                      _DetailRow(
                        icon: Icons.shopping_cart,
                        label: 'Items',
                        value: '${order.items!.length} item(s)',
                        color: Colors.purple,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
