import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentification_controller.dart';

class RegisterController extends GetxController with StateMixin {
  final registerFormKey = GlobalKey<FormState>();
  final _emailAuthController =
      Get.find<AuthentificationController>().emailAuthController;
  TextEditingController get email => _emailAuthController.emailController;

  TextEditingController cpassword = .new();
  TextEditingController password = .new();
  TextEditingController fName = .new();
  TextEditingController lName = .new();
  TextEditingController phone = .new();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  bool obscurePassword = true;
  void toggleObscurePwd() {
    obscurePassword = !obscurePassword;
    update(['obscurePassword']);
  }

  void onRegister() async {
    try {
      if (registerFormKey.currentState!.validate()) {
        await _emailAuthController.startRegistration();
        Get.bottomSheet(
          Container(
            padding: EdgeInsets.all(20),
            width: Get.width,
            height: Get.height * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Enter Verification Code'),
                TextField(
                  controller: _emailAuthController.verificationCodeController,
                  decoration: InputDecoration(labelText: 'Verification Code'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _verifyCode,
                  child: Text('Verify'),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Registration failed',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> _verifyCode() async {
    try {
      if (_emailAuthController.verificationCodeController.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Please enter the verification code',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      await _emailAuthController.verifyRegistrationCode();
      _emailAuthController.passwordController.text = password.text;
      await _emailAuthController.finishRegistration();
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Verification failed',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
