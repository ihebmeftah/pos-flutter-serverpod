import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';

class DashboardController extends GetxController with StateMixin<void> {
  Stats? stats;
  @override
  void onInit() {
    getStats();
    super.onInit();
  }

  Future<void> getStats() async {
    try {
      stats = await ServerpodClient.instance.stats.getStats(
        LocalStorage().building!.id,
      );
      change(null, status: RxStatus.success());
    } catch (e) {
      print('Error fetching stats: $e');
    }
  }
}
