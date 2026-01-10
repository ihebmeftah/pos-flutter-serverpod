import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart'
    show LocalStorage;
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
          itemCount: state?.length ?? 0,
          itemBuilder: (context, index) {
            final building = state![index];
            return ListTile(
              onTap: () async {
                bottomSheet(
                  children: [
                    Text(
                      "Building: ${building.name}",
                      style: context.textTheme.titleLarge,
                    ),
                    /*     if (building.photos != null)
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: CarouselView(
                          itemExtent: 350,
                          children: List.generate(
                            controller.buildings[index].photos!.length,
                            (i) => Image.network(
                              controller.buildings[index].photos![i],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                   */
                  ],
                );
              },
              leading: CircleAvatar(
                child: const Icon(Icons.apartment),
              ),
              title: Text(building.name),
              subtitle: Text(
                '${building.address} ${building.openingTime} - ${building.closingTime}',
              ),
              trailing: TextButton(
                onPressed: () async {
                  await LocalStorage().saveBuilding(building);
                  Get.offAllNamed(Routes.INDEX);
                },
                child: Text("Consult"),
              ),
            );
          },
        ),
        onEmpty: Appemptyscreen(),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
