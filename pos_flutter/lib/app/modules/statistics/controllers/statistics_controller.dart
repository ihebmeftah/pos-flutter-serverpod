import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';

import '../../../../config/serverpod_client.dart';

class StatisticsController extends GetxController with StateMixin {
  late BuildingDetailedStats buildingDetailedStats;

  /// this filter by current month (from first to last day)
  DateTime fromDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );
  DateTime toDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month + 1,
    0,
    23,
    59,
    59,
    999,
  );

  final RxBool isRefreshing = false.obs;

  @override
  void onInit() {
    getBuildingDetailsStats();
    super.onInit();
  }

  Future<void> getBuildingDetailsStats() async {
    try {
      change(null, status: RxStatus.loading());
      buildingDetailedStats = await ServerpodClient.instance.stats
          .getBuildingDetailedStats(
            LocalStorage().building!.id,
            startDate: fromDateTime,
            endDate: toDateTime,
          );
      change(buildingDetailedStats, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> refreshStats() async {
    isRefreshing.value = true;
    await getBuildingDetailsStats();
    isRefreshing.value = false;
  }

  void setDateRange(DateTime from, DateTime to) {
    fromDateTime = from;
    toDateTime = to;
    getBuildingDetailsStats();
  }

  void setCurrentMonth() {
    final now = DateTime.now();
    fromDateTime = DateTime(now.year, now.month, 1);
    toDateTime = DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999);
    getBuildingDetailsStats();
  }

  void setLastMonth() {
    final now = DateTime.now();
    final lastMonth = DateTime(now.year, now.month - 1, 1);
    fromDateTime = lastMonth;
    toDateTime = DateTime(
      lastMonth.year,
      lastMonth.month + 1,
      0,
      23,
      59,
      59,
      999,
    );
    getBuildingDetailsStats();
  }

  void setLast7Days() {
    final now = DateTime.now();
    fromDateTime = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 6));
    toDateTime = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
    getBuildingDetailsStats();
  }

  void setLast30Days() {
    final now = DateTime.now();
    fromDateTime = now.subtract(const Duration(days: 29));
    toDateTime = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
    getBuildingDetailsStats();
  }
}
