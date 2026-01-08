import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class IndexController extends GetxController with StateMixin<UserProfile> {
  late UserProfile userProfile;
  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    try {
      change(null, status: RxStatus.loading());
      userProfile = await ServerpodClient.instance.emailIdp.getUserProfile();
      print('User Profile: ${userProfile.toJson()}');
      change(userProfile, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  final pageVCtr = PageController();
  int currBnb = 0;

  void changeBnbContent(int index) {
    if (index != currBnb) {
      currBnb = index;
      pageVCtr.jumpToPage(index);
      update(["bottomNavigationBar"]);
    }
  }
}
