import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/appbeatuifulcard.dart';

import '../../../components/appemptyscreen.dart';
import '../controllers/order_details_controller.dart';
import '../widgets/order_amount_widget.dart';

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
              // Order started by user info
              if (controller.order!.passedBy != null)
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green.shade700,
                    backgroundColor: Colors.green.shade50,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Started by: ${controller.order!.passedBy!.fullName ?? controller.order!.passedBy!.email}',
                  ),
                ),
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: switch (controller
                                  .order!
                                  .items![index]
                                  .payed) {
                                true => Colors.green,
                                _ => Colors.orange,
                              },
                            ),
                            color:
                                switch (controller.order!.items![index].payed) {
                                  true => Colors.green,
                                  _ => Colors.orange,
                                }.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        spacing: 8,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AppBeautifullCard(
                                            child: Icon(Icons.fastfood),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .order!
                                                    .items![index]
                                                    .article
                                                    .name
                                                    .capitalize!,
                                                style: context
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                '${controller.order!.items![index].article.price.toStringAsFixed(2)} DT',
                                                style: context
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Passed by: ${'${controller.order!.items![index].passedBy!.fullName ?? controller.order!.items![index].passedBy!.email}'}",
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      spacing: 5,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          controller.order!.items![index].payed
                                              ? Icons.check_circle
                                              : Icons.schedule,
                                          size: 16,
                                          color:
                                              controller
                                                  .order!
                                                  .items![index]
                                                  .payed
                                              ? Colors.green
                                              : Colors.orange,
                                        ),
                                        Text(
                                          controller.order!.items![index].payed
                                              ? 'PAID'
                                              : 'UNPAID',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                controller
                                                    .order!
                                                    .items![index]
                                                    .payed
                                                ? Colors.green[700]
                                                : Colors.orange[700],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (!controller.order!.items![index].payed)
                                      ElevatedButton(
                                        onPressed: () => controller.payForItem(
                                          controller.order!.items![index],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.zero,
                                          fixedSize: const Size(80, 30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Pay',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              /// Append new items button
              if (controller.order!.status != OrderStatus.payed)
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(Get.width, 50),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  label: Text("Append new items"),
                  icon: Icon(Icons.add),
                ),

              /// Order amount (PAID/REMAINING items)
              OrderAmountWidget(order: controller.order!),

              /// Order closed by user info
              if (controller.order!.closedby != null)
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red.shade700,
                    backgroundColor: Colors.red.shade50,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Closed by: ${controller.order!.closedby!.fullName ?? controller.order!.closedby!.email}',
                  ),
                ),
            ],
          ),
        ),
        onEmpty: const Appemptyscreen(),
      ),
    );
  }
}
