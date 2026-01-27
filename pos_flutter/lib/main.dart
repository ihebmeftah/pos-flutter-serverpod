import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hyper_snackbar/hyper_snackbar.dart';

import 'app/data/local/local_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/apptheme.dart';
import 'config/serverpod_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  await Get.putAsync(() => ServerpodClient().initialize());
  runApp(
    GetMaterialApp(
      title: "POS",
      theme: AppTheme().light,
      navigatorKey: HyperSnackbar.navigatorKey,
      unknownRoute: AppPages.unknownRoute,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      initialRoute: Routes.AUTHENTIFICATION,
      getPages: AppPages.routes,
      builder: (context, child) {
        return Overlay(
          initialEntries: [OverlayEntry(builder: (context) => child!)],
        );
      },
    ),
  );
}
