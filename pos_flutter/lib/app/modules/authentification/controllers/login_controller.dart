import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class LoginController extends GetxController {
  final loginformKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool obscurePassword = true;

  TextEditingController emailCtr = .new();
  TextEditingController passwordCtr = .new();

  void onLogin() async {
    try {
      if (loginformKey.currentState!.validate()) {
        final data = await ServerpodClient.instance.emailIdp.loginReworked(
          email: emailCtr.text,
          password: passwordCtr.text,
        );
        if (data.employer != null) {
          LocalStorage().saveBuilding(data.employer!.building!);
        }
        ServerpodClient.instance.auth.updateSignedInUser(data.authSuccess);
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Unauthorized) {
        Get.snackbar(
          'Credentials Error',
          'Invalid email or password. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } on AuthUserBlockedException {
      Get.snackbar(
        'Login Error',
        'Your account has been blocked. Please contact support.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void toggleObscurePwd() {
    obscurePassword = !obscurePassword;
    update(['obscurePassword']);
  }

  void toggleRemebreMe() {
    rememberMe = !rememberMe;
    update(['rememberMe']);
  }
}
