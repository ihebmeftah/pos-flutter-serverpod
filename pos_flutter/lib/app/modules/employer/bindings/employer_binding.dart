import 'package:get/get.dart';

import '../controllers/employer_controller.dart';

class EmployerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerController>(
      () => EmployerController(),
    );
  }
}
