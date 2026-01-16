import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/extensions/status.extension.dart';

import '../../../components/appemptyscreen.dart';
import '../../../components/apperrorscreen.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../../../routes/app_pages.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: controller.currentTabIndex,
      child: Scaffold(
        persistentFooterDecoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        persistentFooterButtons: [
          TabBar(
            onTap: controller.changeTab,
            labelStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            dividerHeight: 0,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Progress'),
              Tab(text: 'Paid'),
            ],
          ),
        ],
        appBar:
            controller.tableId != null &&
                Get.currentRoute.contains(Routes.ORDERS_TABLES)
            ? AppBar(title: const Text('Orders'), centerTitle: true)
            : null,
        body: controller.obx(
          (state) => RefreshIndicator(
            onRefresh: controller.getOrders,
            child: Scrollbar(
              thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: controller.orders.isEmpty
                    ? Appemptyscreen(
                        message: 'No orders found',
                      )
                    : ListView.separated(
                        itemCount: controller.orders.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          final order = controller.orders[index];
                          final totalPrice = order.items!.fold<double>(
                            0.0,
                            (sum, item) => sum + item.article.price,
                          );
                          return ListTile(
                            tileColor: order.status.color.withValues(alpha: .9),

                            onTap: () => Get.toNamed(
                              '${Routes.ORDER_DETAILS}/${order.id}',
                            ),
                            leading: Row(
                              spacing: 5,
                              mainAxisSize: .min,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/svg/table.svg",
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  "№${order.btable!.number}",
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            isThreeLine: false,
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            title: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: order.status.color700,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${order.status.name.toUpperCase()} - ${totalPrice.toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
          onError: (error) => AppErrorScreen(message: error),
        ),
      ),
    );
  }
}
