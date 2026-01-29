import 'package:get/get.dart';

import '../controllers/cash_register_stats_controller.dart';

class CashRegisterStatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CashRegisterStatsController>(
      () => CashRegisterStatsController(),
    );
  }
}
