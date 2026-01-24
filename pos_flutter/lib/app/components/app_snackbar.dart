import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppSnackbar {
  AppSnackbar._();

  static void success([
    String? message,
  ]) => ElegantNotification.success(
    width: Get.width * 0.85,
    height: Get.height * 0.15,
    background: Colors.green.shade600,
    showProgressIndicator: false,
    animation: AnimationType.fromRight,
    title: const Text(
      'Success',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(
      message ?? "Operation completed successfully.",
      style: const TextStyle(color: Colors.white),
    ),
  ).show(Get.context!);

  static void error([
    String? message,
  ]) => ElegantNotification.error(
    width: Get.width * 0.85,
    height: Get.height * 0.15,
    background: Colors.red.shade600,
    showProgressIndicator: false,
    animation: AnimationType.fromRight,
    title: const Text(
      'Error',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(
      message ?? "Oops! Something went wrong, please try again.",
      style: const TextStyle(color: Colors.white),
    ),
  ).show(Get.context!);

  static void info(
    String message,
  ) => ElegantNotification(
    width: Get.width * 0.85,
    height: Get.height * 0.15,
    icon: Icon(Icons.info, color: Colors.blue.shade100),
    background: Colors.blue.shade600,
    showProgressIndicator: false,
    animation: AnimationType.fromRight,
    title: const Text(
      'Info',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(message, style: const TextStyle(color: Colors.white)),
  ).show(Get.context!);
}
