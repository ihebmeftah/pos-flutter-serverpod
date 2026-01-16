import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/app/modules/order/controllers/order_details_controller.dart';

class OrderInfo extends GetView<OrderDetailsController> {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return
    /// Order header details
    Column(
      spacing: 10,
      children: [
        Row(
          spacing: 10,
          children: [
            /// Table Number
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    _squareContainer(context, child: Icon(Icons.table_bar)),
                    Flexible(
                      child: Text(
                        "Table №${controller.order!.btable!.number}",
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///Order status
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    _squareContainer(context, child: Icon(Icons.receipt_long)),
                    Flexible(
                      child: Text(
                        "${controller.order!.status.name.capitalize}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.brown.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            spacing: 10,
            children: [
              _squareContainer(context, child: Icon(Icons.list_alt)),
              Flexible(
                child: Text(
                  "Order items (${controller.order!.items!.length})",
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _squareContainer(
    BuildContext context, {
    final double? width,
    final double? height,
    final Color? color,
    bgColor,
    required final Widget child,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: color ?? Colors.white,
        ),
      ),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.brown,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
