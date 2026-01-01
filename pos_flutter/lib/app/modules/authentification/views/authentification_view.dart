import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';

import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => Get.toNamed(Routes.LOGIN),
          child: Text("Login"),
        ),
      ),
    );
  }
}
