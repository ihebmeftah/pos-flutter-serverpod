import 'dart:developer';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../components/app_snackbar.dart';
import '../../../data/local/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../../tables/controllers/tables_controller.dart';
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
      reset();
      if (Get.isRegistered<TablesController>()) {
        Get.find<TablesController>().getTabels();
      }
      if (Get.isRegistered<OrderController>()) {
        Get.find<OrderController>().getOrders();
      }
    } on AppException catch (e) {
      AppSnackbar.info(e.message);
      return;
    } catch (e) {
      AppSnackbar.error('Failed to pass order');
    }
  }

  CreateOrderDto get createOrderDto => CreateOrderDto(
    btableId: table!.id,
    buildingId: LocalStorage().building!.id,
    itemsIds: selectedArticles
        .map(
          (article) => article.id,
        )
        .toList(),
  );

  Future<void> createOrder() async {
    try {
      //? Create new order when tabe available
      final passedOrder = await ServerpodClient.instance.order.createOrder(
        createOrderDto,
      );
      Get.offAndToNamed("${Routes.ORDER_DETAILS}/${passedOrder.id}");
      AppSnackbar.success('Order created successfully');
    } catch (e) {
      rethrow;
    }
  }

  AppendItemsDto get appendItemsDto => AppendItemsDto(
    orderId: currOrder!.id,
    itemIds: selectedArticles.map((a) => a.id).toList(),
    buildingId: LocalStorage().building!.id,
  );
  Future<void> appendItemToOrder() async {
    try {
      await ServerpodClient.instance.orderItem.appendItemsToOrder(
        appendItemsDto,
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
