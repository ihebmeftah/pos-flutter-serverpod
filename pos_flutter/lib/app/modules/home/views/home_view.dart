import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/modules/dashboard/views/dashboard_view.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../../inventory/views/inventory_view.dart';
import '../../order/views/order_view.dart';
import '../../tables/views/tables_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   floatingActionButton:
          (controller.currentUserAccess?.orderCreation ?? true) &&
              controller.scope.contains(
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
      drawer: GetBuilder<HomeController>(
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
                      if (!controller.scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(FluentIcons.building_20_regular),
                          title: Text('Buildings'),
                          onTap: () => Get.offAllNamed(Routes.BUILDINGS),
                        ),
                      if (!controller.scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(FluentIcons.edit_20_regular),
                          title: Text(
                            'Edit ${LocalStorage().building?.name ?? "None"}',
                          ),
                          onTap: () => Get.toNamed(
                            Routes.FORM_BUILDING,
                            parameters: {
                              'id': LocalStorage().building!.id.toString(),
                            },
                          ),
                        ),
                      if (controller.scope.contains(
                            "owner",
                          ) ||
                          controller
                                  .currentUserAccess
                                  ?.cashRegisterManagement ==
                              true)
                        ListTile(
                          leading: Icon(FluentIcons.money_calculator_20_filled),
                          title: Text(
                            "Cash register control",
                          ),
                          onTap: () => Get.toNamed(
                            Routes.CASH_REGISTER,
                          ),
                        ),
                      if (!controller.scope.contains(
                        "employer",
                      ))
                        ListTile(
                          leading: Icon(FluentIcons.person_20_regular),
                          title: Text('Employers'),
                          onTap: () => Get.toNamed(Routes.EMPLOYER),
                        ),
                      if (controller.scope.contains(
                        "owner",
                      ))
                        ListTile(
                          leading: Icon(FluentIcons.key_20_regular),
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
      ),

      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (l) {
          return controller.status.isLoading
              ? SizedBox()
              : GetBuilder<HomeController>(
                  id: "bottomNavigationBar",
                  builder: (_) {
                    return BottomNavigationBar(
                      items: controller.scope.contains("employer")
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
          children: controller.scope.contains("employer")
              ? [TablesView(), SizedBox(), OrderView()]
              : [DashboardView(), InventoryView(), TablesView(), OrderView()],
        ),
      ),
    );
  }
}
