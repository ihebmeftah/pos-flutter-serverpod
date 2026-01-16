import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/buildings/controllers/buildings_controller.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../../config/serverpod_client.dart';
import '../../../extensions/datetime.extension.dart';

class FormBuildingController extends GetxController with StateMixin {
  int? get id => int.tryParse(Get.parameters['id'] ?? "");

  final addFormkey = GlobalKey<FormState>();
  DateTime openingTime = DateTime.now();
  DateTime closingTime = DateTime.now().add(const Duration(hours: 14));
  final name = TextEditingController(),
      location = TextEditingController(),
      opening = TextEditingController(),
      closing = TextEditingController();
  Currency? currencyCode;
  bool tableMultiOrder = false;
  bool allowAppendingItemsToOrder = true;
  bool autoCloseOrdersAtClosingTime = false;

  @override
  void onInit() async {
    if (id != null) {
      await getBuildingById();
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Building get addDto => Building(
    id: id,
    name: name.text,
    address: location.text,
    openingTime: openingTime,
    closingTime: closingTime,
    currencyCode: currencyCode!,
    autoCloseOrdersAtClosingTime: false,
    allowAppendingItemsToOrder: true,
    lat: position?.latitude,
    long: position?.longitude,
    //   dbName: name.text.toLowerCase().replaceAll(' ', '_'),
    tableMultiOrder: tableMultiOrder,
    authUserId: ServerpodClient.instance.auth.authInfo!.authUserId,
  );
  void changeTableMultiOrder(bool? t) {
    tableMultiOrder = t!;
    update(['tableMultiOrder']);
  }

  void changeAllowAppendingItemsToOrder(bool? t) {
    allowAppendingItemsToOrder = t!;
    update(['allowAppendingItemsToOrder']);
  }

  void changeAutoCloseOrdersAtClosingTime(bool? t) {
    autoCloseOrdersAtClosingTime = t!;
    update(['autoCloseOrdersAtClosingTime']);
  }

  void changeCurrencyCode(Currency? c) {
    currencyCode = c;
    update(['currencyCode']);
  }

  Future<void> addBuilding() async {
    try {
      if (addFormkey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        if (id != null) {
          await ServerpodClient.instance.building.updateBuilding(
            addDto,
          );
        } else {
          await ServerpodClient.instance.building.createBuilding(
            addDto,
          );
        }
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

  Future<void> getBuildingById() async {
    try {
      if (id != null) {
        final buildingDetails = await ServerpodClient.instance.building
            .getBuildingById(id!);
        name.text = buildingDetails.name;
        location.text = buildingDetails.address;
        openingTime = buildingDetails.openingTime;
        opening.text = buildingDetails.openingTime.toTimeOnly;
        closing.text = buildingDetails.closingTime.toTimeOnly;
        closingTime = buildingDetails.closingTime;
        currencyCode = buildingDetails.currencyCode;
        tableMultiOrder = buildingDetails.tableMultiOrder;
        allowAppendingItemsToOrder = buildingDetails.allowAppendingItemsToOrder;
        autoCloseOrdersAtClosingTime =
            buildingDetails.autoCloseOrdersAtClosingTime;
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to load building details"));
    }
  }

  Position? position;
  Future<void> determinAddresBasedonCurrLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position!.latitude,
        position!.longitude,
      );
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        location.text =
            "${place.country}, ${place.administrativeArea}, ${place.street} ";
        update(['location']);
      }
    } else {
      Get.snackbar(
        "Permission Denied",
        "Location permission is required to determine address based on current location.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
