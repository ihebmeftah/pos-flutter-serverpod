import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class BuildingsController extends GetxController
    with StateMixin<List<Building>> {
  final buildings = <Building>[].obs;
  @override
  void onInit() async {
    await getBuilding();
    super.onInit();
  }

  Future getBuilding() async {
    try {
      buildings(await ServerpodClient.instance.building.getAllBuildings());
      if (buildings.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(buildings, status: RxStatus.success());
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load buildings'));
    }
  }
}
