import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';
import 'package:pos_flutter/app/extensions/datetime.extension.dart';
import 'package:pos_flutter/app/themes/apptheme.dart';
import 'package:pos_flutter/config/serverpod_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../../components/appemptyscreen.dart';
import '../../../routes/app_pages.dart';
import '../controllers/buildings_controller.dart';

class BuildingsView extends GetView<BuildingsController> {
  const BuildingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.FORM_BUILDING),
        icon: const Icon(Icons.add),
        label: const Text('Add Building'),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Buildings'),
        actions: [
          IconButton(
            onPressed: ServerpodClient.instance.auth.signOutDevice,
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: controller.obx(
        (state) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state?.length ?? 0,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final building = state![index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => controller.consult(index),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppTheme().primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.apartment,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              spacing: 5,
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  building.name.capitalize!,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        building.address,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 1),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 18,
                            color: Colors.grey[600],
                          ),
                          Text(
                            '${building.openingTime.toTimeOnly} - ${building.closingTime.toTimeOnly}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton.icon(
                            onPressed: () => Get.toNamed(
                              Routes.FORM_BUILDING,
                              parameters: {'id': building.id.toString()},
                            ),
                            icon: const Icon(Icons.edit),
                            label: const Text('Edit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        onEmpty: Appemptyscreen(
          message: 'No buildings found',
          pressText: 'Add your first building',
          onPressed: () => Get.toNamed(Routes.FORM_BUILDING),
        ),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
