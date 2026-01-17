import 'dart:async';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';

import '../../../../config/serverpod_client.dart';
import '../../../routes/app_pages.dart';

class OrderController extends GetxController with StateMixin {
  final RxList<Order> orders = <Order>[].obs;
  UuidValue? get tableId => Get.parameters['tableId'] != null
      ? UuidValue.fromString(Get.parameters['tableId']!)
      : null;
  @override
  void onInit() async {
    await getOrders();
    super.onInit();
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
          tableId!,
          orderStatus,
        );
      } else {
        orders.value = await ServerpodClient.instance.order
            .getOrdersByBuilingId(
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
