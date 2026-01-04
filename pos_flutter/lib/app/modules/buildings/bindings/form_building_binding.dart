import 'package:get/get.dart';

import '../controllers/form_building_controller.dart';

class FormBuildingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormBuildingController>(
      () => FormBuildingController(),
    );
  }
}
