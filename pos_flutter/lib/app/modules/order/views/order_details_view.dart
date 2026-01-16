import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/appbeatuifulcard.dart';
import 'package:pos_flutter/app/extensions/status.extension.dart';
import 'package:pos_flutter/app/modules/index/controllers/index_controller.dart';

import '../../../components/appemptyscreen.dart';
import '../../../components/apperrorscreen.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../controllers/order_details_controller.dart';
import '../widgets/order_item_status_buttons.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(
              Icons.receipt_long,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Text(
              'Order Details',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.getOrderById(),
          ),
        ],
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            children: [
              /// Order header details
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
                          AppBeautifullCard(child: Icon(Icons.table_bar)),
                          Text(
                            "Table No ${controller.order!.btable!.number}",
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade700,
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
                          AppBeautifullCard(child: Icon(Icons.receipt_long)),
                          Text(
                            "${controller.order!.status.name.capitalize}",
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              /// Order items list
              Expanded(
                child: ListView.builder(
                  itemCount: controller.order!.items!.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<OrderDetailsController>(
                      id: controller.order!.items![index].id,
                      builder: (_) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: controller
                                  .order!
                                  .items![index]
                                  .itemStatus
                                  .color,
                            ),
                            color: controller
                                .order!
                                .items![index]
                                .itemStatus
                                .color50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 5,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    color: controller
                                        .order!
                                        .items![index]
                                        .itemStatus
                                        .color700,
                                  ),
                                  Text(
                                    controller
                                        .order!
                                        .items![index]
                                        .article
                                        .name
                                        .capitalize!,
                                    style: context.textTheme.titleLarge
                                        ?.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: controller
                                              .order!
                                              .items![index]
                                              .itemStatus
                                              .color700,
                                        ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${controller.order!.items![index].article.price.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}',
                                    style: context.textTheme.titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: controller
                                              .order!
                                              .items![index]
                                              .itemStatus
                                              .color700,
                                        ),
                                  ),
                                ],
                              ),
                              OrderItemStatusButtons(
                                orderItem: controller.order!.items![index],
                                index: index,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

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

                  /// Action Buttons
                  if (controller.order!.status != OrderStatus.payed &&
                      Get.find<IndexController>().scope.contains("employer"))
                    ElevatedButton.icon(
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
                            'Pay (${Get.find<OrderDetailsController>().unpaidAmount.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol})',
                          );
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        onEmpty: const Appemptyscreen(),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
