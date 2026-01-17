import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/appemptyscreen.dart';
import '../../../components/apperrorscreen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/order_controller.dart';
import '../widgets/order_card.dart';

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

                          return OrderCard(
                            order: order,
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
