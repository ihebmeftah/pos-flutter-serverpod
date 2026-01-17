import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class RegisterController extends GetxController with StateMixin {
  final registerFormKey = GlobalKey<FormState>();

  TextEditingController email = .new();
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
        UuidValue accountRequestId = await ServerpodClient.instance.emailIdp
            .registerReworked(
              email: email.text.trim(),
            );
        TextEditingController verifCodeController = .new();
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
                  controller: verifCodeController,
                  decoration: InputDecoration(labelText: 'Verification Code'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      _verifyCode(verifCodeController.text, accountRequestId),
                  child: Text('Verify'),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
        );
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Conflict) {
        AppSnackbar.info(
          "An account with the email ${email.text} already exists",
        );
      }
    } catch (e) {
      AppSnackbar.error(
        'An unexpected error occurred during registration. Please try again later.',
      );
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> _verifyCode(String verifCode, UuidValue accountRequestId) async {
    try {
      if (verifCode.isEmpty) {
        AppSnackbar.error('Please enter the verification code');
        return;
      }
      final authSuccess = await ServerpodClient.instance.emailIdp
          .verifyRegistrationCodeReworked(
            verificationCode: verifCode,
            accountRequestId: accountRequestId,
            password: password.text,
          );
      await ServerpodClient.instance.emailIdp.client.auth.updateSignedInUser(
        authSuccess,
      );
    } catch (e) {
      AppSnackbar.error(
        'Verification failed. Please check the code and try again.',
      );
    }
  }
}
