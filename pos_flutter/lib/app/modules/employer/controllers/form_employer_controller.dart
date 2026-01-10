import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
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

  UserProfileData get profileDto => UserProfileData(
    fullName: fname.text,
    email: email.text,
  );

  void createEmployyer() async {
    try {
      if (formKey.currentState!.validate()) {
        final employer = await ServerpodClient.instance.users
            .createEmployerAccount(
              profileDto,
              password.text,
              LocalStorage().building!.id!,
            );
        Get.find<EmployerController>().getEmployers();
        Get.back(result: employer);
        Get.snackbar('Success', 'Employer created successfully');
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      Get.snackbar('Error', 'Failed to create employer: $e');
    }
  }
}
