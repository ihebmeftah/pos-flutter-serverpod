import 'package:get/get.dart';

import '../../order/controllers/pass_order_controller.dart';
import '../controllers/index_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(
      () => IndexController(),
    );
    Get.put<PassOrderController>(PassOrderController());
  }
}
