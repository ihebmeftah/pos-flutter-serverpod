import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/modules/access/controllers/access_controller.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';

class AccessFormController extends GetxController with StateMixin {
  UuidValue? get id => Get.parameters['id'] != null
      ? UuidValue.fromString(Get.parameters['id']!)
      : null;
  @override
  void onInit() async {
    if (id != null) {
      await getAccessDetails();
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  final name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool orderCreation = true;
  void updateOrderCreation(bool? value) {
    orderCreation = value!;
    update(['orderCreation']);
  }

  bool orderPayment = true;
  void updateOrderPayment(bool? value) {
    orderPayment = value!;
    update(['orderPayment']);
  }

  bool orderItemsPayment = true;
  void updateOrderItemsPayment(bool? value) {
    orderItemsPayment = value!;
    update(['orderItemsPayment']);
  }

  bool consultAllOrders = false;
  void updateConsultAllOrders(bool? value) {
    consultAllOrders = value!;
    update(['consultAllOrders']);
  }

  bool orderCreationNotif = false;
  void updateOrderCreationNotif(bool? value) {
    orderCreationNotif = value!;
    update(['orderCreationNotif']);
  }

  bool appendItems = false;
  void updateAppendItems(bool? value) {
    appendItems = value!;
    update(['appendItems']);
  }

  bool preparation = false;
  void updatePreparation(bool? value) {
    preparation = value!;
    update(['preparation']);
  }

  bool serveOrder = false;
  void updateServeOrder(bool? value) {
    serveOrder = value!;
    update(['serveOrder']);
  }

  bool cashRegisterManagement = false;
  void updateCashRegisterManagement(bool? value) {
    cashRegisterManagement = value!;
    update(['cashRegisterManagement']);
  }

  Access get _accessDto => Access(
    id: id,
    name: name.text,
    orderCreation: orderCreation,
    orderPayment: orderPayment,
    orderItemsPayment: orderItemsPayment,
    consultAllOrders: consultAllOrders,
    orderCreationNotif: orderCreationNotif,
    appendItems: appendItems,
    preparation: preparation,
    serveOrder: serveOrder,
    cashRegisterManagement: cashRegisterManagement,
    buildingId: LocalStorage().building!.id,
  );

  void createAccess() async {
    try {
      if (formKey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        if (id != null) {
          await ServerpodClient.instance.access.updateAccess(
            _accessDto,
          );
        } else {
          await ServerpodClient.instance.access.createAccess(
            _accessDto,
          );
        }
        AppSnackbar.success();
        Get.find<AccessController>().getAccess();
        Get.back();
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Conflict) {
        change(null, status: RxStatus.success());
        AppSnackbar.info(
          "Access with the name ${_accessDto.name} already exists",
        );
        return;
      }
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to create accesses"));
    }
  }

  Future<void> getAccessDetails() async {
    try {
      final accessDetails = await ServerpodClient.instance.access.getAccessById(
        id!,
      );
      name.text = accessDetails.name;
      orderCreation = accessDetails.orderCreation;
      orderPayment = accessDetails.orderPayment;
      orderItemsPayment = accessDetails.orderItemsPayment;
      consultAllOrders = accessDetails.consultAllOrders;
      orderCreationNotif = accessDetails.orderCreationNotif;
      appendItems = accessDetails.appendItems;
      preparation = accessDetails.preparation;
      serveOrder = accessDetails.serveOrder;
      cashRegisterManagement = accessDetails.cashRegisterManagement;
    } catch (e) {
      change(null, status: RxStatus.error("Failed to fetch access details"));
    }
  }
}
