import 'package:get/get.dart';

import '../../order/controllers/pass_order_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<PassOrderController>(PassOrderController());
  }
}
