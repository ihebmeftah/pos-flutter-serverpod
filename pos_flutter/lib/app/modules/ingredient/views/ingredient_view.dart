import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/appemptyscreen.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/apptheme.dart';
import '../controllers/ingredient_controller.dart';

class IngredientView extends GetView<IngredientController> {
  const IngredientView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.INGREDIENT_FORM),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: controller.obx(
        (s) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: controller.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = controller.ingredients[index];
              final stockPercentage = ingredient.thresholdStock > 0
                  ? (ingredient.currentStock / ingredient.thresholdStock).clamp(
                      0.0,
                      1.0,
                    )
                  : 1.0;
              final isLowStock =
                  ingredient.currentStock <= ingredient.thresholdStock;
              return GestureDetector(
                onTap: () => Get.toNamed(
                  Routes.INGREDIENT_FORM,
                  parameters: {'id': ingredient.id.toString()},
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 5,
                            children: [
                              Text(
                                ingredient.name.capitalize!,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.scale,
                                    size: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ingredient.unit.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Colors.grey.shade600,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Stock',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Colors.grey.shade600,
                                        ),
                                  ),
                                  Text(
                                    '${ingredient.currentStock}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: isLowStock
                                              ? Colors.red
                                              : AppTheme().primary,
                                        ),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: stockPercentage,
                                  minHeight: 6,
                                  backgroundColor: Colors.grey.shade200,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isLowStock
                                        ? Colors.red
                                        : AppTheme().primary,
                                  ),
                                ),
                              ),
                              if (isLowStock) ...[
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        size: 12,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Low Stock',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        onEmpty: Appemptyscreen(
          message: "No ingredients found. Please add new ingredients.",
          onPressed: () => Get.toNamed(Routes.INGREDIENT_FORM),
        ),
        onError: (error) => AppErrorScreen(
          message: error,
        ),
      ),
    );
  }
}
