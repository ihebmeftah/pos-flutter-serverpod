import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class Appemptyscreen extends StatelessWidget {
  const Appemptyscreen({super.key, this.route});
  final String? route;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400, minWidth: 300),
        child: EmptyWidget(route: route, press: press, getText: getText),
      ),
    );
  }

  VoidCallback? get press {
    if (Get.currentRoute == route || Get.currentRoute == Routes.BUILDINGS) {
      return () => Get.toNamed(Routes.FORM_BUILDING);
    }

    return null;
  }

  String get getText {
    if (Get.currentRoute == route || Get.currentRoute == Routes.BUILDINGS) {
      return "You don't have any buildings yet.";
    }
    return "";
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.route,
    required this.press,
    required this.getText,
  });

  final String? route;
  final VoidCallback? press;
  final String getText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        disabledBackgroundColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.brown.shade700,
        disabledForegroundColor: Colors.brown.shade700,
        disabledIconColor: Colors.brown.shade700,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: press,
      child: Column(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info_outline, size: 30),
          Text(
            getText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          if (press != null)
            Text(
              "Click here to add (+) one.",
              style: TextStyle(color: Colors.brown.shade800),
            ),
        ],
      ),
    );
  }
}
