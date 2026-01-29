import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/order/controllers/order_details_controller.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../../config/serverpod_client.dart';
import '../../order/controllers/order_controller.dart';
import '../../tables/controllers/tables_controller.dart';

class HomeController extends GetxController with StateMixin {
  late UserProfile userProfile;
  Employer? employer;
  Access? get currentUserAccess => employer?.access;
  Set<String> scope = <String>{};
  late final StreamSubscription<StreamOrder> _subStreamOrder;
  Future<void> startListening() async {
    try {
      _subStreamOrder = ServerpodClient.instance.order
          .watchChanges(LocalStorage().building!.id)
          .listen((order) {
            if (Get.isRegistered<OrderController>()) {
              Get.find<OrderController>().getOrders();
            }
            if (Get.isRegistered<TablesController>()) {
              Get.find<TablesController>().getTabels();
            }
            if (Get.isRegistered<OrderDetailsController>()) {
              Get.find<OrderDetailsController>().getOrderById();
            }
            if (order.orderCreatedBy?.id != userProfile.id) {
              AppSnackbar.info(
                order.message,
                content: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue.shade200,
                  ),
                  onPressed: () =>
                      Get.toNamed('${Routes.ORDER_DETAILS}/${order.orderId}'),
                  icon: const Icon(FluentIcons.eye_16_regular),
                  label: Text("See the order"),
                ),
              );
            }
          });
    } on StateError {
      print('Stream has already been listened to');
    }
  }

  @override
  void dispose() {
    _subStreamOrder.cancel();
    super.dispose();
  }

  @override
  void onInit() async {
    await getUserProfile();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    try {
      change(null, status: RxStatus.loading());
      userProfile = await ServerpodClient.instance.emailIdp.getUserProfile();
      scope = userProfile.authUser!.scopeNames;
      if (scope.contains("employer")) {
        employer = await ServerpodClient.instance.employer
            .getEmployerByIdentifier(userProfile.authUserId);
        LocalStorage().saveBuilding(employer!.building!);
        if (currentUserAccess?.orderCreationNotif == true) {
          startListening();
        }
      }
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
    if (scope.contains("owner")) {
      if (index != 3) {
        Get.delete<OrderController>();
      } else if (index == 3) {
        Get.put<OrderController>(OrderController());
      }
      if (index != 2) {
        Get.delete<TablesController>();
      } else if (index == 2) {
        Get.put<TablesController>(TablesController());
      }
    } else {
      if (scope.contains("employer")) {
        if (index != 1) {
          Get.delete<OrderController>();
        } else if (index == 1) {
          Get.put<OrderController>(OrderController());
        }
        if (index != 0) {
          Get.delete<TablesController>();
        } else if (index == 0) {
          Get.put<TablesController>(TablesController());
        }
      }
    }
  }
}
