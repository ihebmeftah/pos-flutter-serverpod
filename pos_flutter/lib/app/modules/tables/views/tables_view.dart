import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tables_controller.dart';

class TablesView extends GetView<TablesController> {
  const TablesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TablesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TablesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
