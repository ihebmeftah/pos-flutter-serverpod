import 'dart:async';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/order/controllers/order_details_controller.dart';
import 'package:pos_flutter/app/modules/tables/controllers/tables_controller.dart';

import '../../../../config/serverpod_client.dart';
import '../../../routes/app_pages.dart';

class OrderController extends GetxController with StateMixin {
  final StreamSubscription<Order> _orderCreateSubscription = ServerpodClient
      .instance
      .order
      .streamCreateOrder(LocalStorage().building!.id!)
      .listen((order) {
        // TODO: Handle order/table update [without send requests]
        Get.snackbar(
          "New order",
          "A new order need your attention",
          
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.primaryColorLight,
          colorText: Get.theme.primaryColorDark,
        );
        Get.find<OrderController>().getOrders();
        Get.find<TablesController>().getTabels();
      });
  final StreamSubscription<Order> _orderUpdateSubscription = ServerpodClient
      .instance
      .order
      .streamUpdateOrder(LocalStorage().building!.id!)
      .listen((order) {
        // TODO: Handle order/table update [without send requests]
        Get.find<OrderController>().getOrders();
        Get.find<TablesController>().getTabels();
        if (Get.isRegistered<OrderDetailsController>()) {
          final orderDetailsController = Get.find<OrderDetailsController>();
          if (orderDetailsController.id == order.id.toString()) {
            orderDetailsController.getOrderById();
          }
        }
      });

  final RxList<Order> orders = <Order>[].obs;
  String? tableId = Get.parameters['tableId'];
  @override
  void onInit() async {
    await getOrders();
    super.onInit();
  }

  @override
  void onClose() {
    _orderCreateSubscription.cancel();
    _orderUpdateSubscription.cancel();
    super.onClose();
  }

  Future<void> getOrders() async {
    try {
      final orderStatus = currentTabIndex == 0
          ? null
          : currentTabIndex == 1
          ? OrderStatus.progress
          : OrderStatus.payed;
      if (tableId != null && Get.currentRoute.contains(Routes.ORDERS_TABLES)) {
        orders.value = await ServerpodClient.instance.order.getOrdersOfTable(
          int.parse(tableId!),
          orderStatus,
        );
      } else {
        orders.value = await ServerpodClient.instance.order.getOrders(
          LocalStorage().building!.id,
          orderStatus,
        );
      }
      change(orders, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load orders'));
    }
  }

  int currentTabIndex = 1;
  void changeTab(int index) {
    currentTabIndex = index;
    getOrders();
  }
}
