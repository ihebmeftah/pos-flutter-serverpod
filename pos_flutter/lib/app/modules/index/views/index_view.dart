import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/modules/inventory/views/inventory_view.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../../order/controllers/pass_order_controller.dart';
import '../../order/views/order_view.dart';
import '../../tables/views/tables_view.dart';
import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.PASS_ORDER),
        child: GetBuilder<PassOrderController>(
          id: "table",
          builder: (passOrderCtr) {
            return Badge(
              isLabelVisible: passOrderCtr.table != null,
              label: Text("!", style: TextStyle(color: Colors.white)),
              child: SvgPicture.asset(
                "assets/images/svg/order.svg",
                colorFilter: ColorFilter.mode(
                  controller.currBnb == 1
                      ? Theme.of(
                          context,
                        ).bottomNavigationBarTheme.selectedItemColor!
                      : Theme.of(
                          context,
                        ).bottomNavigationBarTheme.unselectedItemColor!,
                  BlendMode.srcIn,
                ),
              ),
            );
          },
        ),
      ),
      drawer: GetBuilder<IndexController>(
        builder: (ctr) {
          return controller.status.isLoading
              ? Center(child: CircularProgressIndicator())
              : Drawer(
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(),
                        accountName: Text('${controller.userProfile.fullName}'),
                        accountEmail: Text('${controller.userProfile.email}'),
                      ),
                      if (!Get.find<IndexController>().scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(Icons.place),
                          title: Text('Buildings'),
                          onTap: () => Get.offAllNamed(Routes.BUILDINGS),
                        ),
                      Spacer(),
                      SafeArea(
                        child: ListTile(
                          textColor: Colors.red,
                          iconColor: Colors.red,
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () async {
                            await LocalStorage().clear();
                            await ServerpodClient.instance.auth
                                .signOutAllDevices();
                            Get.offAllNamed(Routes.AUTHENTIFICATION);
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      appBar: AppBar(),
      bottomNavigationBar: GetBuilder<IndexController>(
        id: "bottomNavigationBar",
        builder: (_) {
          return BottomNavigationBar(
            items: (Get.find<IndexController>().scope.contains("employer"))
                ? [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/table.svg",
                        colorFilter: ColorFilter.mode(
                          controller.currBnb == 0
                              ? Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.selectedItemColor!
                              : Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Tables',
                    ),

                    BottomNavigationBarItem(
                      icon: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.barcode_reader, size: 20),
                        ),
                      ),
                      label: 'Scan',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/order.svg",
                        colorFilter: ColorFilter.mode(
                          controller.currBnb == 2
                              ? Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.selectedItemColor!
                              : Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Orders',
                    ),
                  ]
                : [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/dashboard.svg",
                        colorFilter: ColorFilter.mode(
                          controller.currBnb == 0
                              ? Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.selectedItemColor!
                              : Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Dashboard',
                    ),

                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/inventory.svg",
                        colorFilter: ColorFilter.mode(
                          controller.currBnb == 1
                              ? Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.selectedItemColor!
                              : Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Inventory',
                    ),

                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/table.svg",
                        colorFilter: ColorFilter.mode(
                          controller.currBnb == 2
                              ? Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.selectedItemColor!
                              : Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Tables',
                    ),

                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/order.svg",
                        colorFilter: ColorFilter.mode(
                          controller.currBnb == 3
                              ? Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.selectedItemColor!
                              : Theme.of(
                                  context,
                                ).bottomNavigationBarTheme.unselectedItemColor!,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Orders',
                    ),
                  ],
            currentIndex: controller.currBnb,
            onTap: controller.changeBnbContent,
          );
        },
      ),
      body: controller.obx(
        (s) => PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: controller.changeBnbContent,
          controller: controller.pageVCtr,
          children: Get.find<IndexController>().scope.contains("employer")
              ? [TablesView(), OrderView()]
              : [HomeView(), InventoryView(), TablesView(), OrderView()],
        ),
      ),
    );
  }
}
