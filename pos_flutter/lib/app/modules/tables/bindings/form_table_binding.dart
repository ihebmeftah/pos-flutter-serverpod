import 'package:get/get.dart';

import '../controllers/form_table_controller.dart';

class FormTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormTableController>(
      () => FormTableController(),
    );
  }
}
