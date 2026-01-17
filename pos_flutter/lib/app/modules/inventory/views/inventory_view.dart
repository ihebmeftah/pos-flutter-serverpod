import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appemptyscreen.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/inventory_controller.dart';

class InventoryView extends GetView<InventoryController> {
  const InventoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 10,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              child: Row(
                spacing: 5,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Ingredients"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Articles Composition"),
                  ),
                ],
              ),
            ),

            /// Out stock ingredient Section
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Out of Stock Ingredients",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("View All"),
                ),
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => Container(
                  width: 120,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade200, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning,
                            size: 16,
                            color: Colors.red.shade700,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              "Ingredient ${index + 1}",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.red.shade900,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Out of stock",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.red.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Categories Section
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.CATEGORIE),
                  child: Text("View All"),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              child: GetBuilder<HomeController>(
                builder: (ctr) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctr.topCategories.length + 1,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) => TextButton.icon(
                      onPressed: () {
                        if (index != 0) return;
                        Get.toNamed(Routes.CATEGORIE_FORM);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: index == 0
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        foregroundColor: index == 0
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        index == 0
                            ? "Add"
                            : ctr.topCategories[index - 1].key.name,
                      ),
                      icon: Icon(
                        index == 0 ? Icons.add : Icons.tag,
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Articles Section
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Articles", style: Theme.of(context).textTheme.titleLarge),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.ARTICLE),
                  child: Text("View All"),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (ctr) {
                  return ctr.topArticles.isEmpty
                      ? Appemptyscreen()
                      : ListView.builder(
                          itemCount: ctr.topArticles.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                ctr.topArticles[index].key.name
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(ctr.topArticles[index].key.name),
                            subtitle: Text(
                              ctr.topArticles[index].key.categorie?.name ??
                                  "No Categorie",
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
