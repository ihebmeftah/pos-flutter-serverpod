import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'config/serverpod_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => ServerpodClient().initialize());
  runApp(
    GetMaterialApp(
      title: "POS",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
