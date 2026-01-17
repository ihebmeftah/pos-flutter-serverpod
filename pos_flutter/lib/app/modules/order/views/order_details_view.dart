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
import '../widgets/order_item_overview_sheet.dart';

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
                          final item = controller.order!.items![index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: item.itemStatus.color,
                                width: 2,
                              ),
                              color: item.itemStatus.color50,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: item.itemStatus.color50,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Item Header
                                Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: item.itemStatus.color700,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.restaurant,
                                        color: item.itemStatus.color50,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item.article.name.capitalize!,
                                        style: context.textTheme.titleLarge
                                            ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: item.itemStatus.color700,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '${item.article.price.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}',
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: item.itemStatus.color700,
                                          ),
                                    ),
                                    TextButton.icon(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                          color: item.itemStatus.color700,
                                        ),
                                        foregroundColor:
                                            item.itemStatus.color700,
                                      ),
                                      onPressed: () => Get.bottomSheet(
                                        OrderItemOverviewSheet(orderItem: item),
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                      ),
                                      icon: Icon(Icons.info_outline),
                                      label: Text("Overview"),
                                    ),
                                  ],
                                ),

                                /// Action Buttons
                                OrderItemStatusButtons(
                                  orderItem: item,
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
