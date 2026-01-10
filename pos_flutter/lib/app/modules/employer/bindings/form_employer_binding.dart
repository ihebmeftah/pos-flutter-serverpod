import 'package:get/get.dart';

import '../controllers/form_employer_controller.dart';

class FormEmployerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormEmployerController>(
      () => FormEmployerController(),
    );
  }
}
