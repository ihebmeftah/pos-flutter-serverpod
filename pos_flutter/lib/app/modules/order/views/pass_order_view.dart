import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pass_order_controller.dart';

class PassOrderView extends GetView<PassOrderController> {
  const PassOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PassOrderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PassOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
