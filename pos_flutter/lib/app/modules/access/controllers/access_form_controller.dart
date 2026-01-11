import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/access/controllers/access_controller.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';

class AccessFormController extends GetxController with StateMixin {
  @override
  void onInit() {
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

  Access get _accessDto => Access(
    name: name.text,
    orderCreation: orderCreation,
    orderPayment: orderPayment,
    orderItemsPayment: orderItemsPayment,
    buildingId: LocalStorage().building!.id!,
  );

  void createAccess() async {
    try {
      if (formKey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        await ServerpodClient.instance.access.createAccess(
          _accessDto,
        );
        Get.find<AccessController>().getAccess();
        Get.back();
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Conflict) {
        change(null, status: RxStatus.success());
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text("Access with the same name already exists"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to create accesses"));
    }
  }
}
