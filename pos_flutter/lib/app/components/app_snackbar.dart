import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppSnackbar {
  AppSnackbar._();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> success([
    String? message,
  ]) => ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Row(
        spacing: 5,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green.shade100,
          ),
          Expanded(
            child: Text(
              message ?? "Operation completed successfully",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
    ),
  );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error([
    String? message,
  ]) => ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Row(
        spacing: 5,
        children: [
          Icon(
            Icons.error,
            color: Colors.red.shade100,
          ),
          Expanded(
            child: Text(
              message ?? "Operation failed, please try again",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
    ),
  );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> info(
    String message,
  ) => ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Row(
        spacing: 5,
        children: [
          Icon(
            Icons.info,
            color: Colors.blue.shade100,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
    ),
  );
}
