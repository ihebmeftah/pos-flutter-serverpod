import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';
import 'package:pos_flutter/app/extensions/datetime.extension.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../components/appbottomsheet.dart';
import '../../../components/appemptyscreen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/buildings_controller.dart';

class BuildingsView extends GetView<BuildingsController> {
  const BuildingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.FORM_BUILDING),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Your Buildings'),
        leading: IconButton(
          onPressed: ServerpodClient.instance.auth.signOutAllDevices,
          icon: Icon(Icons.logout),
        ),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: state?.length ?? 0,
          itemBuilder: (context, index) {
            final building = state![index];
            return ListTile(
              onTap: () async {
                bottomSheet(
                  onConfirm: () => controller.consult(index),
                  confirmeButtonText: "Consult",
                  children: [
                    Text(
                      "Building: ${building.name}",
                      style: context.textTheme.titleLarge,
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.location_on_outlined),
                        Expanded(child: Text(building.address)),
                      ],
                    ),
                    Row(
                      spacing: 5,

                      children: [
                        Icon(Icons.access_time_outlined),
                        Expanded(
                          child: Text(
                            '${building.openingTime.toTimeOnly} - ${building.closingTime.toTimeOnly}',
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text("Update Information and Settings"),
                      onTap: () {
                        Get.back();
                        Get.toNamed(
                          Routes.FORM_BUILDING,
                          parameters: {'id': building.id.toString()},
                        );
                      },
                      leading: Icon(Icons.edit),
                    ),
                    SwitchListTile(
                      value: true,
                      onChanged: (v) {},
                      title: Text("Active"),
                      secondary: Icon(Icons.check_circle_outline),
                    ),
                  ],
                );
              },
              leading: CircleAvatar(
                child: const Icon(Icons.apartment),
              ),
              title: Text(building.name),
              subtitle: Text(
                '${building.address} ${building.openingTime.toTimeOnly} - ${building.closingTime.toTimeOnly}',
              ),
              trailing: TextButton(
                onPressed: () => controller.consult(index),
                child: Text("Consult"),
              ),
            );
          },
        ),
        onEmpty: Appemptyscreen(
          message: 'No buildings found',
          pressText:
              'Click here or tap the + button in the bottom right corner to add a building',
          onPressed: () => Get.toNamed(Routes.FORM_BUILDING),
        ),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
