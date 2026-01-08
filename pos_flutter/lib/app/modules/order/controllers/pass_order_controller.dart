import 'dart:developer';

import 'package:flutter/material.dart' hide Table;
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/index/controllers/index_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../data/local/local_storage.dart';
import '../../../routes/app_pages.dart';
import 'order_controller.dart';

class PassOrderController extends GetxController with StateMixin {
  BTable? table;
  Order? currOrder;
  List<Article> selectedArticles = <Article>[];
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  void setTable([BTable? t]) async {
    if (t == table || t == null) {
      table = null;
      if (currOrder != null) currOrder = null;
      selectedArticles.clear();
      update(['table', 'selectedArticles']);
      change(null, status: RxStatus.empty());
      if (Get.isBottomSheetOpen == true) {
        Get.back();
      }
      return;
    }
    if (t.status == TableStatus.occupied) await getCurrOrderOfTable(t.id!);
    table = t;
    update(['table']);
    change(null, status: RxStatus.success());
  }

  Future<void> getCurrOrderOfTable(int tableid) async {
    try {
      currOrder = await ServerpodClient.instance.order.getOrderCurrOfTable(
        tableid,
      );
    } catch (e) {
      log("Error fetching current order for table $tableid: $e");
    }
  }

  void addArticle(Article article) {
    selectedArticles.add(article);
    _updateSelectedArticleWithOcc();
    update(['selectedArticles', article.id!]);
  }

  void removeArticle(Article article) {
    final first = selectedArticles.indexWhere((a) => a.id == article.id);
    selectedArticles.removeAt(first);
    _updateSelectedArticleWithOcc();
    update(['selectedArticles', article.id!]);
  }

  void clearAllArticles() {
    selectedArticles.clear();
    _updateSelectedArticleWithOcc();
    update(['selectedArticles']);
  }

  void reset() {
    table = null;
    currOrder = null;
    selectedArticles.clear();
    change(null, status: RxStatus.empty());
    update(['table', 'selectedArticles']);
  }

  void passOrder() async {
    try {
      if (currOrder == null && table!.status == TableStatus.available) {
        await createOrder();
      } else {
        if (LocalStorage().building!.tableMultiOrder == true) {
          await createOrder();
        } else {
          await appendItemToOrder();
        }
      }
      if (Get.isRegistered<OrderController>()) {
        Get.find<OrderController>().onInit();
      }
      reset();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pass order",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Order get orderDto => Order(
    btableId: table!.id!,
    passedById: Get.find<IndexController>().userProfile.authUserId,
    closedbyId: Get.find<IndexController>().userProfile.authUserId,
    btable: table,
    items: selectedArticles
        .map(
          (article) => OrderItem(
            article: article,
            passedById: Get.find<IndexController>().userProfile.authUserId,
          ),
        )
        .toList(),
  );
  Future<void> createOrder() async {
    try {
      //? Create new order when tabe available
      final passedOrder = await ServerpodClient.instance.order.createOrder(
        orderDto,
      );
      /*  if (Get.isRegistered<TablesController>()) {
        Get.find<TablesController>().updateTable(passedOrder.btable!);
      }*/
      Get.offAndToNamed("${Routes.ORDER_DETAILS}/${passedOrder.id!}");
      Get.snackbar(
        "Success",
        "Order passed successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> appendItemToOrder() async {
    try {
      //? Create add new item when tabe occupied and have order
      /*await OrderApi().addItemsToOrder(
        orderId: currOrder!.id!,
        articlesIds: selectedArticles.map((a) => a.id).toList(),
      );*/
      Get.offAndToNamed("${Routes.ORDER_DETAILS}/${currOrder!.id!}");
      Get.snackbar(
        "Success",
        "New items added to order successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      rethrow;
    }
  }

  int countArticleOcc(int articleId) {
    return selectedArticles.where((a) => a.id == articleId).length;
  }

  bool existeArticle(int articleId) {
    return selectedArticles.any((a) => a.id == articleId);
  }

  List<({Article article, int occurrence})> selectedArticleWithOcc = [];

  void _updateSelectedArticleWithOcc() {
    final Map<int, int> occMap = {};
    for (var article in selectedArticles) {
      occMap[article.id!] = (occMap[article.id!] ?? 0) + 1;
    }
    selectedArticleWithOcc = occMap.entries.map((entry) {
      final article = selectedArticles.firstWhere((a) => a.id == entry.key);
      return (article: article, occurrence: entry.value);
    }).toList();
  }
}
