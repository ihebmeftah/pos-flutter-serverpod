import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../../config/serverpod_client.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../../order/views/order_view.dart';
import '../../tables/views/tables_view.dart';
import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POS Flutter'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: controller.obx(
          (s) => Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text(
                  '${controller.userProfile.fullName}',
                ),
                accountEmail: Text(
                  '${controller.userProfile.email}',
                ),
              ),
              if (!Get.find<ServerpodClient>().userScopes!.contains("none"))
                ListTile(
                  leading: Icon(Icons.place),
                  title: Text('Buildings'),
                  onTap: () => Get.offAllNamed(Routes.BUILDINGS),
                ),
              if (!Get.find<ServerpodClient>().userScopes!.contains("none"))
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Staff'),
                  onTap: () {},
                ),
              Spacer(),
              SafeArea(
                child: ListTile(
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: ServerpodClient.instance.auth.signOutAllDevices,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<IndexController>(
        id: "bottomNavigationBar",
        builder: (_) {
          return BottomNavigationBar(
            items: (Get.find<ServerpodClient>().userScopes!.contains("none"))
                ? [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/order.svg",
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
                      label: 'Orders',
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
                      label: 'Orders',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/inventory.svg",
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
                      label: 'Inventory',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/svg/table.svg",
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
                      label: 'Tables',
                    ),
                  ],
            currentIndex: controller.currBnb,
            onTap: controller.changeBnbContent,
          );
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: controller.changeBnbContent,
        controller: controller.pageVCtr,
        children: Get.find<ServerpodClient>().userScopes!.contains("none")
            ? [OrderView(), TablesView()]
            : [HomeView(), OrderView(), Text("Inventory"), TablesView()],
      ),
    );
  }
}
