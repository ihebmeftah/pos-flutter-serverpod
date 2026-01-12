import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/modules/order/controllers/order_controller.dart';
import 'package:pos_flutter/app/modules/tables/controllers/tables_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../data/local/local_storage.dart';
import '../../order/controllers/order_details_controller.dart';

/// this main controller for index page which hold bottom navigation bar and page view
/// its contains also anything related to current user like profile and scope
/// it listen to order create and update stream to update order and table info in real time
class IndexController extends GetxController with StateMixin<UserProfile> {
  late UserProfile userProfile;
  late Employer? employer;
  Access? get currentUserAccess => employer?.access;

  Set<String> scope = <String>{};
  @override
  void onInit() {
    getUserProfile();
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
    if (scope.contains("admin")) {
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
        if (index != 2) {
          Get.delete<OrderController>();
        } else if (index == 2) {
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

  final StreamSubscription<Order> _orderCreateSubscription = ServerpodClient
      .instance
      .order
      .streamCreateOrder(LocalStorage().building!.id!)
      .listen((order) {
        // TODO: Handle order/table update [without send requests]
        if (Get.find<IndexController>().currentUserAccess?.orderCreationNotif ??
            false) {
          Get.snackbar(
            "New order",
            "A new order need your attention",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.primaryColorLight,
            colorText: Get.theme.primaryColorDark,
          );
        }
        if (Get.isRegistered<OrderController>()) {
          {
            Get.find<OrderController>().getOrders();
          }
          if (Get.isRegistered<TablesController>()) {
            Get.find<TablesController>().getTabels();
          }
        }
      });

  final StreamSubscription<Order> _orderUpdateSubscription = ServerpodClient
      .instance
      .order
      .streamUpdateOrder(LocalStorage().building!.id!)
      .listen((order) {
        // TODO: Handle order/table update [without send requests]
        if (Get.isRegistered<OrderController>()) {
          {
            Get.find<OrderController>().getOrders();
          }
          if (Get.isRegistered<TablesController>()) {
            Get.find<TablesController>().getTabels();
          }
          if (Get.isRegistered<OrderDetailsController>()) {
            final orderDetailsController = Get.find<OrderDetailsController>();
            if (orderDetailsController.id == order.id.toString()) {
              orderDetailsController.getOrderById();
            }
          }
        }
      });

  final StreamSubscription<Order>
  _orderAppendItemsSubscription = ServerpodClient.instance.order
      .streamAppendItemsOrder(LocalStorage().building!.id!)
      .listen((order) {
        // TODO: Handle order/table update [without send requests]
        if (Get.find<IndexController>().currentUserAccess?.orderCreationNotif ??
            false) {
          Get.snackbar(
            "New items added to order",
            "New items added need your attention",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.primaryColorLight,
            colorText: Get.theme.primaryColorDark,
          );
        }
        if (Get.isRegistered<OrderController>()) {
          {
            Get.find<OrderController>().getOrders();
          }
          if (Get.isRegistered<TablesController>()) {
            Get.find<TablesController>().getTabels();
          }
        }
      });

  @override
  void onClose() {
    _orderCreateSubscription.cancel();
    _orderUpdateSubscription.cancel();
    _orderAppendItemsSubscription.cancel();
    super.onClose();
  }
}
