import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../routes/app_pages.dart';
import '../../order/controllers/pass_order_controller.dart';

class QrscanController extends GetxController {
  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) async {
      try {
        controller.pauseCamera();
        final allowed = RegExp(
          r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}@[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
        );
        Get.back();
        if (allowed.hasMatch(scanData.code!)) {
          final data = (scanData.code as String).split('@');
          BTable table = await ServerpodClient.instance.buildingTables
              .getTableById(
                UuidValue.fromString(data[0]),
                UuidValue.fromString(data[1]),
              );
          Get.find<PassOrderController>().setTable(table);
          Get.toNamed(Routes.PASS_ORDER);
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text('Invalid QR code scanned.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } on AppException catch (e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }
}
