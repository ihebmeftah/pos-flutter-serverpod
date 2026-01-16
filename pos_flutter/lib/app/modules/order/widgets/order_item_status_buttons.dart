import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/order/controllers/order_details_controller.dart';

import '../../../extensions/status.extension.dart';
import '../../index/controllers/index_controller.dart';

class OrderItemStatusButtons extends GetView<OrderDetailsController> {
  const OrderItemStatusButtons({
    super.key,
    required this.orderItem,
    required this.index,
  });
  final OrderItem orderItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    /// Action Buttons
    if (orderItem.itemStatus.isUnPaid) {
      return Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (orderItem.itemStatus == OrderItemStatus.progress)
            _currentStatus("In Progress"),

          /// Pick Buttoon
          if (orderItem.itemStatus == OrderItemStatus.progress &&
              (Get.find<IndexController>().currentUserAccess?.preparation ??
                  true))
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: OrderItemStatus.picked.color,
                minimumSize: Size(Get.width / 3, 38),
                maximumSize: Size(Get.width / 2.5, 38),
              ),
              onPressed:
                  Get.find<IndexController>().scope.contains(
                        "employer",
                      ) &&
                      (Get.find<IndexController>()
                              .currentUserAccess
                              ?.preparation ??
                          true)
                  ? () => controller.changeOrderItemsStatus(
                      index,
                      OrderItemStatus.picked,
                    )
                  : null,
              child: const Text(
                'Pick for prepared',
                style: TextStyle(fontSize: 12),
              ),
            ),

          if (orderItem.itemStatus == OrderItemStatus.picked)
            _currentStatus("Picked for Preparation"),

          /// Ready Buttoon
          if (orderItem.itemStatus == OrderItemStatus.picked &&
              (Get.find<IndexController>().currentUserAccess?.preparation ??
                  true))
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: OrderItemStatus.ready.color,
                minimumSize: Size(Get.width / 3, 38),
                maximumSize: Size(Get.width / 2.5, 38),
              ),
              onPressed:
                  Get.find<IndexController>().scope.contains(
                        "employer",
                      ) &&
                      (Get.find<IndexController>()
                              .currentUserAccess
                              ?.preparation ??
                          true)
                  ? () => controller.changeOrderItemsStatus(
                      index,
                      OrderItemStatus.ready,
                    )
                  : null,
              child: const Text(
                'Ready',
                style: TextStyle(fontSize: 12),
              ),
            ),

          if (orderItem.itemStatus == OrderItemStatus.ready)
            _currentStatus("Ready for Delivery"),

          /// Delivred Buttoon
          if (orderItem.itemStatus == OrderItemStatus.ready &&
              (Get.find<IndexController>().currentUserAccess?.takeOrder ??
                  true))
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: OrderItemStatus.delivered.color,
                minimumSize: Size(Get.width / 3, 38),
                maximumSize: Size(Get.width / 2.5, 38),
              ),
              onPressed:
                  Get.find<IndexController>().scope.contains(
                        "employer",
                      ) &&
                      (Get.find<IndexController>()
                              .currentUserAccess
                              ?.takeOrder ??
                          true)
                  ? () => controller.changeOrderItemsStatus(
                      index,
                      OrderItemStatus.delivered,
                    )
                  : null,
              child: const Text(
                'Delivered',
                style: TextStyle(fontSize: 12),
              ),
            ),

          if (orderItem.itemStatus == OrderItemStatus.delivered)
            _currentStatus("Waiting for Payment"),

          /// Pay Buttoon
          if (orderItem.itemStatus == OrderItemStatus.delivered &&
              (Get.find<IndexController>()
                      .currentUserAccess
                      ?.orderItemsPayment ??
                  true))
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: OrderItemStatus.payed.color,
                minimumSize: Size(Get.width / 3, 38),
                maximumSize: Size(Get.width / 2.5, 38),
              ),
              onPressed: () => controller.payForItem(
                orderItem,
              ),
              child: const Text(
                'Pay',
                style: TextStyle(fontSize: 12),
              ),
            ),
        ],
      );
    }
    return SizedBox();
  }

  Widget _currentStatus(String message) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: orderItem.itemStatus.color700,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
