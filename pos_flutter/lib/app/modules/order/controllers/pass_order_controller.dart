import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

class PassOrderController extends GetxController with StateMixin {
  BTable? table;
  void setTable([BTable? t]) async {
    if (t == table || t == null) {
      table = null;
     // if (currOrder != null) currOrder = null;
     // selectedArticles.clear();
      update(['table', 'selectedArticles']);
      change(null, status: RxStatus.empty());
      if (Get.isBottomSheetOpen == true) {
        Get.back();
      }
      return;
    }
    //if (t.status == TableStatus.occupied) await getCurrOrderOfTable(t.id);
    table = t;
    update(['table']);
    change(null, status: RxStatus.success());
  }
}
