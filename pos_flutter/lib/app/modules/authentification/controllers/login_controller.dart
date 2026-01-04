import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/app/modules/authentification/controllers/authentification_controller.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final _emailAuthController =
      Get.find<AuthentificationController>().emailAuthController;

  final loginformKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool obscurePassword = true;

  TextEditingController get emailController =>
      _emailAuthController.emailController;
  TextEditingController get passwordController =>
      _emailAuthController.passwordController;

  void onLogin() async {
    try {
      if (loginformKey.currentState!.validate()) {
        await _emailAuthController.login();
        if (_emailAuthController.isAuthenticated) {
          Get.offAllNamed(Routes.INDEX);
        } else {
          Get.snackbar(
            'Login Failed',
            'Invalid email or password',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
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
