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
    if (Get.currentRoute == route || Get.currentRoute == Routes.EMPLOYER) {
      return () => Get.toNamed(Routes.FORM_EMPLOYER);
    }
    if ((Get.currentRoute == Routes.INDEX && route == Routes.ARTICLE) ||
        Get.currentRoute == Routes.ARTICLE) {
      return () => Get.toNamed(Routes.ARTICLE_FORM);
    }
    if ((Get.currentRoute == Routes.INDEX && route == Routes.TABLES) ||
        Get.currentRoute == Routes.TABLES) {
      return () => Get.toNamed(Routes.FORM_TABLE);
    }
    if (Get.currentRoute == route || Get.currentRoute == Routes.CATEGORIE) {
      return () => Get.toNamed(Routes.CATEGORIE_FORM);
    }
    if (Get.currentRoute == route || Get.currentRoute == Routes.ACCESS) {
      return () => Get.toNamed(Routes.ACCESS_FORM);
    }
    return null;
  }

  String get getText {
    if (Get.currentRoute == route || Get.currentRoute == Routes.BUILDINGS) {
      return "You don't have any buildings yet.";
    }
    if (Get.currentRoute == route || Get.currentRoute == Routes.EMPLOYER) {
      return "You don't have any employers yet.";
    }
    if ((Get.currentRoute == Routes.INDEX && route == Routes.ARTICLE) ||
        Get.currentRoute == Routes.ARTICLE) {
      return "Your building has no articles yet.";
    }
    if ((Get.currentRoute == Routes.INDEX && route == Routes.TABLES) ||
        Get.currentRoute == Routes.TABLES) {
      return "Your building has no tables yet.";
    }
    if (Get.currentRoute == route || Get.currentRoute == Routes.CATEGORIE) {
      return "Your building has no categories yet.";
    }
    if ((Get.currentRoute == Routes.INDEX && route == Routes.ORDER) ||
        Get.currentRoute == Routes.ORDER) {
      return "Your building has no orders yet.";
    }
    if (Get.currentRoute == route ||
        Get.currentRoute.contains(Routes.ORDER_DETAILS)) {
      return "No details found it seems.";
    }
    if (Get.currentRoute == route || Get.currentRoute.contains(Routes.ACCESS)) {
      return "Your building has no access levels yet.";
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
        backgroundColor: Routes.ARTICLE == route ? null : Colors.grey.shade200,
        foregroundColor: Colors.brown.shade700,
        disabledForegroundColor: Routes.ARTICLE == route
            ? null
            : Colors.brown.shade700,
        disabledIconColor: Colors.brown.shade700,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: press,
      child: Column(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info, size: 30),
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
