import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/employer/controllers/employer_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class FormEmployerController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();
  final fname = TextEditingController(),
      lname = TextEditingController(),
      displayName = TextEditingController(),
      persoEmail = TextEditingController(),
      password = TextEditingController(),
      phone = TextEditingController();
  Access? selectedAccess;
  CreateEmployerDTO get createEmployerDTO => CreateEmployerDTO(
    firstName: fname.text.trim(),
    lastName: lname.text.trim(),
    displayName: displayName.text.trim(),
    persoEmail: persoEmail.text.trim(),
    phone: int.parse(phone.text.trim()),
    password: password.text.trim(),
    buildingId: LocalStorage().building!.id,
    accessId: selectedAccess?.id,
  );

  void createEmployyer() async {
    try {
      if (formKey.currentState!.validate()) {
        final employer = await ServerpodClient.instance.employer
            .createEmployerAccount(
              createEmployerDTO,
            );
        AppSnackbar.success();
        Get.find<EmployerController>().getEmployers();
        Get.back(result: employer);
      }
    } on AppException catch (e) {
      AppSnackbar.error(e.message);
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void selectAccess(Access? access) {
    selectedAccess = access;
    update(["accessDropdown"]);
  }

  void removeAccess() {
    selectedAccess = null;
    update(["accessDropdown"]);
  }

  void onChangeFirstLastName(String value) {
    displayName.text = "${fname.text} ${lname.text}".trim();
  }
}
