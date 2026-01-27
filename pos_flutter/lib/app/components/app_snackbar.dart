import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hyper_snackbar/hyper_snackbar.dart';

class AppSnackbar {
  AppSnackbar._();

  static void success([
    String? message,
  ]) => HyperSnackbar.show(
    backgroundColor: Colors.green.shade700,
    margin: Get.width > 600
        ? EdgeInsetsGeometry.only(
            left: Get.width * 0.6,
            bottom: 10,
            top: 10,
            right: 10,
          )
        : EdgeInsets.all(10),
    title: "Operation Successful",
    message: message ?? "Operation completed successfully.",
  );

  static void error([
    String? message,
  ]) => HyperSnackbar.show(
    backgroundColor: Colors.red.shade700,
    margin: Get.width > 600
        ? EdgeInsetsGeometry.only(
            left: Get.width * 0.6,
            bottom: 10,
            top: 10,
            right: 10,
          )
        : EdgeInsets.all(10),
    title: "Operation Failed",
    message: message ?? "Operation failed.",
  );

  static void info(
    String message,
  ) => HyperSnackbar.show(
    backgroundColor: Colors.blue.shade700,
    margin: Get.width > 600
        ? EdgeInsetsGeometry.only(
            left: Get.width * 0.6,
            bottom: 10,
            top: 10,
            right: 10,
          )
        : EdgeInsets.all(10),
    title: "Information",
    message: message,
  );
}
