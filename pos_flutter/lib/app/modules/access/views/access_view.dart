import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/appemptyscreen.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';

import '../controllers/access_controller.dart';

class AccessView extends GetView<AccessController> {
  const AccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ACCESS_FORM),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Access'),
      ),
      body: controller.obx(
        (s) => ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: controller.access.length,
          separatorBuilder: (c, index) => SizedBox(height: 10),
          itemBuilder: (c, index) => ListTile(
            leading: Icon(
              Icons.vpn_key_outlined,
              color: Colors.brown,
            ),
            tileColor: Colors.brown.shade50,
            title: Text(
              controller.access[index].name.capitalize!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              style: IconButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                Get.defaultDialog(
                  title: "Delete Access",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you sure you want to delete ${controller.access[index].name}?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.red,
                      ),
                      Text(
                        "All users with this access will be without access.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  textConfirm: "Yes",
                  textCancel: "No",
                  confirmTextColor: Colors.white,
                  onConfirm: () {},
                );
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ),
        onEmpty: Appemptyscreen(),
        onError: (error) => AppErrorScreen(message: error!),
      ),
    );
  }
}
