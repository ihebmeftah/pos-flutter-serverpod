import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../data/local/local_storage.dart';

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
      .where((item) => item.payed)
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
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load order'));
    }
  }

  Future<void> payForItem(OrderItem item) async {
    try {
      order = await ServerpodClient.instance.order.payItem(
        order!.id!,
        item.id!,
        LocalStorage().building!.id!,
      );
      change(order, status: RxStatus.success());
      Get.snackbar(
        'Payment Processed',
        'Payment for ${item.article.name} has been processed',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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
      order = await ServerpodClient.instance.order.payAllItems(
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
    } catch (e) {
      Get.snackbar(
        'Payment Error',
        'Failed to pay for all items in the order',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void addNewItem() {
    Get.snackbar(
      'Add Item',
      'Feature to add new items will be implemented',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void closeOrder() {
    final hasUnpaidItems = order!.items!.any((item) => !item.payed);
    Get.dialog(
      AlertDialog(
        title: Text(hasUnpaidItems ? 'Close Order' : 'Complete Order'),
        content: Text(
          hasUnpaidItems
              ? 'This order has unpaid items. Are you sure you want to close it?'
              : 'Mark this order as completed?',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.back(); // Return to orders list
              Get.snackbar(
                'Order Updated',
                hasUnpaidItems
                    ? 'Order has been closed'
                    : 'Order has been completed',
                backgroundColor: Colors.blue,
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: hasUnpaidItems ? Colors.orange : Colors.blue,
            ),
            child: Text(hasUnpaidItems ? 'Close' : 'Complete'),
          ),
        ],
      ),
    );
  }
}
