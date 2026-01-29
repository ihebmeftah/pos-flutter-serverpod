import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../../config/serverpod_client.dart';

class CashRegisterStatsController extends GetxController with StateMixin {
  late CashRegisterStats cashRegisterStats;
  UuidValue cashRegisterId = UuidValue.fromString(Get.parameters['id']!);

  final RxBool isRefreshing = false.obs;

  @override
  void onInit() {
    getCashRegStats();
    super.onInit();
  }

  Future<void> getCashRegStats() async {
    try {
      change(null, status: RxStatus.loading());
      cashRegisterStats = await ServerpodClient.instance.stats
          .getCashRegisterStats(cashRegisterId);
      change(cashRegisterStats, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> refreshStats() async {
    isRefreshing.value = true;
    await getCashRegStats();
    isRefreshing.value = false;
  }
}
