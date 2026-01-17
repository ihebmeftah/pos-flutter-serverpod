import 'dart:developer';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/index/controllers/index_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../components/app_snackbar.dart';
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
    if (t.status == TableStatus.occupied) await getCurrOrderOfTable(t.id);
    table = t;
    update(['table']);
    change(null, status: RxStatus.success());
  }

  Future<void> getCurrOrderOfTable(UuidValue tableid) async {
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
    update(['selectedArticles', article.id]);
  }

  void removeArticle(Article article) {
    final first = selectedArticles.indexWhere((a) => a.id == article.id);
    selectedArticles.removeAt(first);
    _updateSelectedArticleWithOcc();
    update(['selectedArticles', article.id]);
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
      if (status.isLoading) return;
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
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Forbidden) {
        AppSnackbar.info(e.message);
        return;
      }
    } catch (e) {
      AppSnackbar.error('Failed to pass order');
    }
  }

  Order get orderDto => Order(
    btableId: table!.id,
    btable: table,
    passedById: Get.find<IndexController>().userProfile.id!,
    items: selectedArticles
        .map(
          (article) => OrderItem(
            id: null,
            article: article,
            passedById: Get.find<IndexController>().userProfile.id!,
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
      Get.offAndToNamed("${Routes.ORDER_DETAILS}/${passedOrder.id}");
      AppSnackbar.success('Order created successfully');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> appendItemToOrder() async {
    try {
      await ServerpodClient.instance.orderItem.appendItemsToOrder(
        currOrder!.id,
        orderDto.items!,
      );
      Get.offAndToNamed("${Routes.ORDER_DETAILS}/${currOrder!.id}");
      AppSnackbar.success('Items added to existing order successfully');
    } catch (e) {
      rethrow;
    }
  }

  int countArticleOcc(UuidValue articleId) {
    return selectedArticles.where((a) => a.id == articleId).length;
  }

  bool existeArticle(UuidValue articleId) {
    return selectedArticles.any((a) => a.id == articleId);
  }

  List<({Article article, int occurrence})> selectedArticleWithOcc = [];

  void _updateSelectedArticleWithOcc() {
    final Map<UuidValue, int> occMap = {};
    for (var article in selectedArticles) {
      occMap[article.id] = (occMap[article.id] ?? 0) + 1;
    }
    selectedArticleWithOcc = occMap.entries.map((entry) {
      final article = selectedArticles.firstWhere((a) => a.id == entry.key);
      return (article: article, occurrence: entry.value);
    }).toList();
  }
}
