import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/extensions/datetime.extension.dart';
import 'package:pos_flutter/app/modules/inventory/views/inventory_view.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';
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
      /*   floatingActionButton:
          (controller.currentUserAccess?.orderCreation ?? true) &&
              Get.find<IndexController>().scope.contains(
                "employer",
              )
          ? FloatingActionButton(
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
            )
          : null, */
      drawer: GetBuilder<IndexController>(
        builder: (ctr) {
          return controller.status.isLoading
              ? SizedBox()
              : Drawer(
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(),
                        accountName: controller.userProfile.fullName != null
                            ? Text('${controller.userProfile.fullName}')
                            : null,
                        accountEmail: Text('${controller.userProfile.email}'),
                      ),
                      if (!Get.find<IndexController>().scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(Icons.place),
                          title: Text('Buildings'),
                          subtitle: Text(
                            'Current : ${LocalStorage().building?.name ?? "None"}',
                          ),
                          onTap: () => Get.offAllNamed(Routes.BUILDINGS),
                        ),
                      if (!Get.find<IndexController>().scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(Icons.edit_location),
                          title: Text(
                            'Edit current Building ${LocalStorage().building?.name ?? "None"}',
                          ),
                          onTap: () => Get.toNamed(
                            Routes.FORM_BUILDING,
                            parameters: {
                              'id': LocalStorage().building!.id.toString(),
                            },
                          ),
                        ),
                      if (Get.find<IndexController>().scope.contains(
                            "admin",
                          ) ||
                          controller
                                  .currentUserAccess
                                  ?.cashRegisterManagement ==
                              true)
                        ListTile(
                          leading: Icon(Icons.point_of_sale),
                          title: Text(
                            "Cash register control",
                          ),
                          onTap: () => Get.toNamed(
                            Routes.CASH_REGISTER,
                          ),
                        ),
                      if (!Get.find<IndexController>().scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Employers'),
                          onTap: () => Get.toNamed(Routes.EMPLOYER),
                        ),
                      if (Get.find<IndexController>().scope.contains(
                        "owner",
                      ))
                        ListTile(
                          leading: Icon(Icons.security),
                          title: Text('Accesses'),
                          onTap: () => Get.toNamed(Routes.ACCESS),
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
                            await ServerpodClient.instance.auth.signOutDevice();
                            Get.offAllNamed(Routes.AUTHENTIFICATION);
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      appBar: AppBar(
        title: Text('POS ${LocalStorage().building!.name.capitalize}'),
        bottom: LocalStorage().building!.orderWithCashRegister == true
            ? PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: Container(
                  width: double.infinity,
                  color: Colors.brown.shade100,
                  padding: EdgeInsets.all(8.0),
                  child: GetBuilder<IndexController>(
                    id: 'cashRegister',
                    builder: (_) {
                      return LocalStorage().building!.orderWithCashRegister ==
                              true
                          ? Text(
                              controller.currentCashRegister == null
                                  ? "No active Cash Register"
                                  : 'Cash Register started at  ${controller.currentCashRegister?.start.toShortDateTimeString}'
                                        .toUpperCase(),
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            )
                          : SizedBox();
                    },
                  ),
                ),
              )
            : null,
      ),

      bottomNavigationBar: GetBuilder<IndexController>(
        builder: (l) {
          return controller.status.isLoading
              ? SizedBox()
              : GetBuilder<IndexController>(
                  id: "bottomNavigationBar",
                  builder: (_) {
                    return BottomNavigationBar(
                      items:
                          Get.find<IndexController>().scope.contains("employer")
                          ? [
                              BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                  "assets/images/svg/table.svg",
                                  colorFilter: ColorFilter.mode(
                                    controller.currBnb == 0
                                        ? Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .selectedItemColor!
                                        : Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .unselectedItemColor!,
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
                                              )
                                              .bottomNavigationBarTheme
                                              .selectedItemColor!
                                        : Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .unselectedItemColor!,
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
                                              )
                                              .bottomNavigationBarTheme
                                              .selectedItemColor!
                                        : Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .unselectedItemColor!,
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
                                              )
                                              .bottomNavigationBarTheme
                                              .selectedItemColor!
                                        : Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .unselectedItemColor!,
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
                                              )
                                              .bottomNavigationBarTheme
                                              .selectedItemColor!
                                        : Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .unselectedItemColor!,
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
                                              )
                                              .bottomNavigationBarTheme
                                              .selectedItemColor!
                                        : Theme.of(
                                                context,
                                              )
                                              .bottomNavigationBarTheme
                                              .unselectedItemColor!,
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
                );
        },
      ),
      body: controller.obx(
        (s) => PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: controller.changeBnbContent,
          controller: controller.pageVCtr,
          children: Get.find<IndexController>().scope.contains("employer")
              ? [TablesView(), SizedBox(), OrderView()]
              : [HomeView(), InventoryView(), TablesView(), OrderView()],
        ),
      ),
    );
  }
}
