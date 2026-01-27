import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/extensions/status.extension.dart';
import 'package:pos_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';

import '../../../components/appbottomsheet.dart';
import '../../../components/appemptyscreen.dart';
import '../../../data/local/local_storage.dart';
import '../../order/controllers/pass_order_controller.dart';
import '../controllers/tables_controller.dart';
import '../widgets/tableitemwidget.dart';
import '../widgets/tablestatuswidget.dart';

class TablesView extends GetView<TablesController> {
  const TablesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Get.previousRoute == Routes.PASS_ORDER
          ? AppBar(title: const Text('Tables'), centerTitle: true)
          : null,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: controller.obx(
          (_) => Column(
            spacing: 5,
            children: [
              if (Get.find<HomeController>().scope.contains("owner"))
                TextButton.icon(
                  onPressed: controller.generateTablePdfQrcode,
                  label: const Text('Generate Tables QR Code'),
                  icon: const Icon(Icons.qr_code),
                ),
              Row(
                spacing: 20,
                mainAxisAlignment: .center,
                children: [
                  TableStatusWidget(
                    color: Colors.greenAccent,
                    status: "Available (${controller.availableNb})",
                  ),
                  TableStatusWidget(
                    color: Colors.brown.shade700,
                    status: "Occupied (${controller.occupiedNb})",
                  ),
                  //   TableStatusWidget(color: Colors.red, status: "Reserved (3)"),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: GetPlatform.isWeb && !GetPlatform.isMobile
                        ? 4
                        : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: GetPlatform.isWeb && !GetPlatform.isMobile
                        ? 1
                        : 0.89,
                  ),
                  itemCount: controller.searchTables.length,
                  itemBuilder: (context, index) => GetBuilder<TablesController>(
                    id: controller.searchTables[index].id,
                    builder: (_) {
                      return TableItemWidget(
                        onTap: () {
                          final passOrderCtr = Get.find<PassOrderController>();
                          if (Get.previousRoute == Routes.PASS_ORDER) {
                            passOrderCtr.setTable(
                              controller.searchTables[index],
                            );
                            return;
                          } 
                          bottomSheet(
                            onConfirm:
                                (Get.find<HomeController>()
                                            .currentUserAccess
                                            ?.orderCreation ??
                                        true) &&
                                    Get.find<HomeController>().scope.contains(
                                      "employer",
                                    )
                                ? () {
                                    Get.back();
                                    passOrderCtr.setTable(
                                      controller.searchTables[index],
                                    );
                                    Get.toNamed(Routes.PASS_ORDER);
                                  }
                                : null,
                            confirmeButtonText: "Pass Order",
                            children: [
                              Row(
                                spacing: 20,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/svg/table.svg',
                                    width: 30,
                                    height: 30,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text(
                                        "Table ${controller.searchTables[index].number}"
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Max seats ${controller.searchTables[index].seatsMax}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: controller
                                          .searchTables[index]
                                          .status
                                          .color700,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller
                                            .searchTables[index]
                                            .status
                                            .label,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (passOrderCtr.table ==
                                  controller.searchTables[index])
                                ListTile(
                                  title: Text('Unselect Table'),
                                  onTap: () => passOrderCtr.setTable(
                                    controller.searchTables[index],
                                  ),
                                ),

                              if (LocalStorage().building!.tableMultiOrder)
                                ListTile(
                                  title: Text('Consult table orders'),
                                  onTap: () => Get.toNamed(
                                    "${Routes.ORDERS_TABLES}/${controller.searchTables[index].id}",
                                  ),
                                ),
                              if (!LocalStorage().building!.tableMultiOrder &&
                                  controller.searchTables[index].status ==
                                      TableStatus.occupied)
                                ListTile(
                                  title: Text(
                                    'Consult table current order',
                                  ),
                                  onTap: () => Get.toNamed(
                                    "${Routes.ORDER_DETAILS}/${controller.searchTables[index].id}",
                                    parameters: {'from': 'tables'},
                                  ),
                                ),
                              if (Get.find<HomeController>().scope.contains(
                                "owner",
                              ))
                                GetX<TablesController>(
                                  builder: (_) {
                                    return SwitchListTile(
                                      title: Text(
                                        controller.searchTables[index].active
                                            ? 'Deactivate Table'
                                            : 'Activate Table',
                                      ),
                                      value:
                                          controller.searchTables[index].active,
                                      onChanged: (_) => controller
                                          .changeTableActivation(index),
                                    );
                                  },
                                ),
                            ],
                          );
                        },
                        table: controller.searchTables[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          onEmpty: Appemptyscreen(
            pressText: "Press here to add Table (+)",
            onPressed: () => Get.toNamed(Routes.FORM_TABLE),
          ),
        ),
      ),
    );
  }
}
