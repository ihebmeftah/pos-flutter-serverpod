import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../controllers/home_controller.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: ServerpodClient.instance.auth.signOutAllDevices,
          child: Text("Logout"),
        ),
      ),
    );
  }
}
