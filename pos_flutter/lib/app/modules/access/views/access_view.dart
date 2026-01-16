import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/appemptyscreen.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';
import 'package:pos_flutter/app/routes/app_pages.dart';
import 'package:pos_flutter/app/themes/apptheme.dart';

import '../controllers/access_controller.dart';

class AccessView extends GetView<AccessController> {
  const AccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access Management'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => Get.toNamed(Routes.ACCESS_FORM),
              icon: const Icon(Icons.add, size: 20),
            ),
          ),
        ],
      ),
      body: controller.obx(
        (s) => Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: controller.access.length,
            itemBuilder: (c, index) {
              return InkWell(
                onTap: () => Get.toNamed(
                  Routes.ACCESS_FORM,
                  parameters: {
                    'id': controller.access[index].id.toString(),
                  },
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: .center,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.admin_panel_settings_rounded,
                            color: AppTheme().primary,
                          ),
                        ),
                        Text(
                          controller.access[index].name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red.shade400,
                          ),
                          onPressed: () => _showDeleteDialog(
                            context,
                            controller.access[index].name,
                            index,
                          ),
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            size: 18,
                          ),
                          label: Text("Delete"),
                        ),
                        // Delete Button
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        onEmpty: Appemptyscreen(
          message: 'No access levels found',
          pressText: 'Tap here to add an access level',
          onPressed: () => Get.toNamed(Routes.ACCESS_FORM),
        ),
        onError: (error) => AppErrorScreen(message: error!),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String accessName, int index) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red.shade400,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Delete Access',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Are you sure you want to delete "$accessName"?',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.red.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'All users with this access will lose their permissions',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.deleleAcces(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
