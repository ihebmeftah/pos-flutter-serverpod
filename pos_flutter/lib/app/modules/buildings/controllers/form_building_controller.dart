import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/buildings/controllers/buildings_controller.dart';

import '../../../../config/serverpod_client.dart';

class FormBuildingController extends GetxController with StateMixin {
  final addFormkey = GlobalKey<FormState>();
  DateTime openingTime = DateTime.now();
  DateTime closingTime = DateTime.now().add(const Duration(hours: 14));
  final name = TextEditingController(),
      location = TextEditingController(),
      opening = TextEditingController(),
      closing = TextEditingController();
  bool tableMultiOrder = false;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Building get addDto => Building(
    name: name.text,
    address: location.text,
    openingTime: openingTime,
    closingTime: closingTime,
    //   dbName: name.text.toLowerCase().replaceAll(' ', '_'),
    tableMultiOrder: tableMultiOrder,
  );
  void changeTableMultiOrder(bool? t) {
    tableMultiOrder = t!;
    update(['tableMultiOrder']);
  }

  Future<void> addBuilding() async {
    try {
      if (addFormkey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        await ServerpodClient.instance.building.createBuilding(
          addDto,
        );
        Get.find<BuildingsController>().onInit();
        Get.back();
      }
      change(null, status: RxStatus.success());
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add building: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void pickOpeningTime() async {
    final time = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay(hour: 07, minute: 00),
    );
    if (time != null) {
      opening.text = time.format(Get.context!);
      openingTime = DateTime(
        openingTime.year,
        openingTime.month,
        openingTime.day,
        time.hour,
        time.minute,
      );
    }
  }

  void pickClosingTime() async {
    final time = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay(hour: 23, minute: 00),
    );
    if (time != null) {
      closing.text = time.format(Get.context!);
      closingTime = DateTime(
        closingTime.year,
        closingTime.month,
        closingTime.day,
        time.hour,
        time.minute,
      );
    }
  }
}
