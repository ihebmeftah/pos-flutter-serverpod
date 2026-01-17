import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appemptyscreen.dart';
import '../../../components/apperrorscreen.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/apptheme.dart';
import '../controllers/categorie_controller.dart';

class CategorieView extends GetView<CategorieController> {
  const CategorieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                Get.toNamed(Routes.CATEGORIE_FORM);
              },
              icon: const Icon(Icons.add, size: 20),
            ),
          ),
        ],
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return GestureDetector(
                onTap: () => Get.toNamed(
                  Routes.ARTICLE,
                  parameters: {'catId': category.id!.toString()},
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      // Image Container
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppTheme().primary.withValues(alpha: 0.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.grid_4x4,
                                size: 48,
                                color: AppTheme().primary.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Content Section
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                category.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                foregroundColor: AppTheme().primary,
                              ),
                              onPressed: () => Get.toNamed(
                                Routes.CATEGORIE_FORM,
                                parameters: {
                                  'id': category.id!.toString(),
                                },
                              ),
                              icon: Icon(Icons.edit_square),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        onEmpty: Appemptyscreen(
          message: 'No categories found',
          pressText:
              'Click here or tap the + button in the top right corner to add a category',
          onPressed: () => Get.toNamed(Routes.CATEGORIE_FORM),
        ),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
