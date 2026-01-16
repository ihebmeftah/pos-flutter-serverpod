import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../data/local/local_storage.dart';
import '../../../extensions/status.extension.dart';

class OrderDetailsController extends GetxController with StateMixin {
  String get id => Get.parameters['id']!;
  String? get from => Get.parameters['from'];
  Order? order;

  @override
  void onInit() {
    getOrderById();
    super.onInit();
  }

  num get totalPrice =>
      order!.items!.fold<num>(0.0, (sum, item) => sum + item.article.price);
  num get paidAmount => order!.items!
      .where((item) => item.itemStatus.isPaid)
      .fold<num>(0.0, (sum, item) => sum + item.article.price);
  num get unpaidAmount => (totalPrice - paidAmount);

  Future<void> getOrderById() async {
    try {
      if (from == 'tables') {
        order = await ServerpodClient.instance.order.getOrderCurrOfTable(
          int.parse(id),
        );
      } else {
        order = await ServerpodClient.instance.order.getOrderById(
          int.parse(id),
        );
      }
      if (order == null) {
        change(null, status: RxStatus.empty());
      } else {
        change(order, status: RxStatus.success());
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.NotFound) {
        change(null, status: RxStatus.empty());
        return;
      }
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load order'));
    }
  }

  Future<void> payForItem(OrderItem item) async {
    try {
      final updatedItems = await ServerpodClient.instance.orderItem
          .payOrderItem(
            order!.id!,
            [item.id!],
            LocalStorage().building!.id!,
          );
      for (var updatedItem in updatedItems) {
        final index = order!.items!.indexWhere(
          (element) => element.id == updatedItem.id,
        );
        if (index != -1) {
          order!.items![index] = updatedItem;
        }
      }
      change(order, status: RxStatus.success());
      Get.snackbar(
        'Payment Processed',
        'Payment for ${item.article.name} has been processed',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Forbidden) {
        Get.snackbar(
          'Payment Error',
          'Only employers with access can process item payments',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }
      change(order, status: RxStatus.error(e.message));
    } catch (e) {
      Get.snackbar(
        'Payment Error',
        'Failed to pay for item: ${item.article.name}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> payAllItems() async {
    try {
      order = await ServerpodClient.instance.orderItem.payAllItems(
        order!.id!,
        LocalStorage().building!.id!,
      );
      Get.snackbar(
        'Payment Processed',
        'All items have been paid',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      change(order, status: RxStatus.success());
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Forbidden) {
        Get.snackbar(
          'Payment Error',
          'Only employers with access can pay for all items in the order',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }
      change(order, status: RxStatus.error(e.message));
    } catch (e) {
      Get.snackbar(
        'Payment Error',
        'Failed to pay for all items in the order',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void changeOrderItemsStatus(int index, OrderItemStatus newStataus) async {
    try {
      final items = await ServerpodClient.instance.orderItem
          .changeOrderItemsStatus(
            [order!.items![index].id!],
            newStataus,
          );
      order!.items![index] = items.first;
      change(order, status: RxStatus.success());
    } catch (e) {
      Get.snackbar(
        'Payment Error',
        'Failed to change items status',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
