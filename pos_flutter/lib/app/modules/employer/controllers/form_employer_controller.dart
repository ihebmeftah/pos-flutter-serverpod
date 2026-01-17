import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/employer/controllers/employer_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class FormEmployerController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();
  final fname = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      phone = TextEditingController();
  Access? selectedAccess;
  UserProfileData get profileDto => UserProfileData(
    fullName: fname.text,
    email: email.text,
  );

  void createEmployyer() async {
    try {
      if (formKey.currentState!.validate()) {
        final employer = await ServerpodClient.instance.employer
            .createEmployerAccount(
              profileDto,
              password.text,
              LocalStorage().building!.id!,
              selectedAccess?.id,
            );
        AppSnackbar.success();
        Get.find<EmployerController>().getEmployers();
        Get.back(result: employer);
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
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
}
