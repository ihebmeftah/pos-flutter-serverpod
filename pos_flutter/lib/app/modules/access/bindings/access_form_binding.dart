import 'package:get/get.dart';

import '../controllers/access_form_controller.dart';

class AccessFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessFormController>(
      () => AccessFormController(),
    );
  }
}
