import 'package:get/get.dart';

import '../controllers/access_controller.dart';


class AccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessController>(
      () => AccessController(),
    );
  }
}
