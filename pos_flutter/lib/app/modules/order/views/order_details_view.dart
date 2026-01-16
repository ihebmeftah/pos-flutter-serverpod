import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/extensions/status.extension.dart';
import 'package:pos_flutter/app/modules/order/widgets/order_info.dart';

import '../../../components/appemptyscreen.dart';
import '../../../components/apperrorscreen.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../controllers/order_details_controller.dart';
import '../widgets/order_item_status_buttons.dart';
import '../widgets/order_payment_button.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (state) => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                /// Order header details
                OrderInfo(),

                /// Order items list
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.order!.items!.length,
                    itemBuilder: (context, index) {
                      return GetBuilder<OrderDetailsController>(
                        id: controller.order!.items![index].id!,
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
                              crossAxisAlignment: .start,
                              children: [
                                Row(
                                  spacing: 5,
                                  crossAxisAlignment: .center,
                                  mainAxisAlignment: .center,
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

                ///Order Payment Button
                OrderPaymentButton(),
              ],
            ),
          ),
          onEmpty: const Appemptyscreen(),
          onError: (error) => AppErrorScreen(message: error),
        ),
      ),
    );
  }
}
