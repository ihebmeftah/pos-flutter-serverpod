import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../../index/controllers/index_controller.dart';
import '../controllers/order_details_controller.dart';

class OrderPaymentButton extends GetView<OrderDetailsController> {
  const OrderPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
    /// Order amount (PAID/REMAINING items)
    Column(
      spacing: 10,
      children: [
        ///  Total Amount, Paid Amount & Remaining Amount
        GetBuilder<OrderDetailsController>(
          id: "pay",
          builder: (ctr) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                spacing: 5,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paid Amount',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '${ctr.paidAmount.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Remaining',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        '${ctr.unpaidAmount.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),

        /// Payment order Button
        Row(
          spacing: 10,
          children: [
            /// Back Button
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            if (controller.order!.status != OrderStatus.payed &&
                Get.find<IndexController>().scope.contains(
                  "employer",
                ))
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed:
                      (Get.find<IndexController>()
                              .currentUserAccess
                              ?.orderPayment ??
                          true)
                      ? Get.find<OrderDetailsController>().payAllItems
                      : null,
                  icon: const Icon(Icons.payment),
                  label: GetBuilder<OrderDetailsController>(
                    id: "pay",
                    builder: (_) {
                      return Text(
                        'Pay (${controller.unpaidAmount.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol})',
                      );
                    },
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),

            if (controller.order!.status == OrderStatus.payed &&
                Get.find<IndexController>().scope.contains(
                  "employer",
                ))
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.print),
                  label: Text(
                    "Print Receipt",
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
