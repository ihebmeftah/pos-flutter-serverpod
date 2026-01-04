import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../order/controllers/order_controller.dart';
import '../../tables/controllers/tables_controller.dart';

class IndexController extends GetxController with StateMixin<UserProfileModel> {
  late UserProfileModel userProfile;
  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    try {
      change(null, status: RxStatus.loading());
      userProfile = await ServerpodClient.instance.emailIdp.getUserProfile();
      change(userProfile, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  final pageVCtr = PageController();
  int currBnb = 0;

  void changeBnbContent(int index) {
    if (index != currBnb) {
      if (Get.find<ServerpodClient>().userScopes!.contains("none") &&
          index == 1) {
        return;
      }
      currBnb = index;
      pageVCtr.jumpToPage(index);
      update(["bottomNavigationBar"]);
      if ((Get.find<ServerpodClient>().userScopes!.contains("admin") &&
          index != 3)) {
        Get.delete<TablesController>();
      } else {
        Get.put<TablesController>(TablesController());
      }
      if (Get.find<ServerpodClient>().userScopes!.contains("admin") &&
          index != 1) {
        Get.delete<OrderController>();
      } else {
        Get.put<OrderController>(OrderController());
      }
    }
  }
}
