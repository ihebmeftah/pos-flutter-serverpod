import 'package:get/get.dart';

import '../controllers/employer_details_controller.dart';

class EmployerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerDetailsController>(
      () => EmployerDetailsController(),
    );
  }
}
