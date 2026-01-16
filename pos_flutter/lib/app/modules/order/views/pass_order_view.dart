import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../components/appformfield.dart';
import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../../../routes/app_pages.dart';
import '../controllers/pass_order_controller.dart';

class PassOrderView extends GetView<PassOrderController> {
  const PassOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pass Order'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: controller.reset, child: const Text("Reset")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: controller.obx(
          (s) => Column(
            spacing: 15,
            children: [
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/svg/table.svg",
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'Table ${controller.table!.number}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  IconButton(
                    onPressed: () => Get.toNamed(Routes.TABLES),
                    icon: const Icon(Icons.sync),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GetBuilder<PassOrderController>(
                    id: "selectedArticles",
                    builder: (_) {
                      return controller.selectedArticles.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "No articles selected yet.",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  onPressed: () => Get.toNamed(Routes.ARTICLE),
                                  child: const Text("Select Articles"),
                                ),
                              ],
                            )
                          : Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLabel(
                                  label:
                                      "Items : ${controller.selectedArticles.length}",
                                ),
                                Expanded(
                                  child: Scrollbar(
                                    thumbVisibility: true,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .selectedArticleWithOcc
                                          .length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          trailing: IconButton(
                                            onPressed: () =>
                                                controller.removeArticle(
                                                  controller
                                                      .selectedArticleWithOcc[index]
                                                      .article,
                                                ),
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                          leading: Text(
                                            controller
                                                .selectedArticleWithOcc[index]
                                                .occurrence
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          title: Text(
                                            controller
                                                .selectedArticleWithOcc[index]
                                                .article
                                                .name
                                                .capitalize!,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "${controller.selectedArticleWithOcc[index].article.price} ${LocalStorage().building!.currencyCode.symbol}",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  spacing: 5,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.red,
                                      ),
                                      onPressed: controller.clearAllArticles,
                                      child: const Text("Clear All"),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.blue,
                                      ),
                                      onPressed: controller.clearAllArticles,
                                      child: const Text("Specification"),
                                    ),
                                    IconButton(
                                      style: IconButton.styleFrom(
                                        iconSize: 18,
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () =>
                                          Get.toNamed(Routes.ARTICLE),
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                    },
                  ),
                ),
              ),
              /*   AppFormField.label(
                maxLines: 4,
                minLines: 1,
                label: "Notes",
                hint: "Add any notes for the order here...",
              ),*/
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.table!.status == TableStatus.occupied &&
                      LocalStorage().building!.tableMultiOrder == false)
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: Text("This table is currently occupied."),
                      subtitle: Text(
                        "You are now appending new items to the existing order.",
                      ),
                    ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        flex: 2,
                        child: GetBuilder<PassOrderController>(
                          id: "selectedArticles",
                          builder: (_) {
                            return ElevatedButton(
                              onPressed: controller.selectedArticles.isEmpty
                                  ? null
                                  : controller.passOrder,
                              child: const Text("Pass Order"),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: GetBuilder<PassOrderController>(
                          id: "selectedArticles",
                          builder: (passOrderCtr) {
                            return Text(
                              "${passOrderCtr.selectedArticles.fold<num>(0, (sum, article) => sum + article.price).toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}",
                              style: Theme.of(context).textTheme.displaySmall,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "You can't pass an order without\nselecting a table.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () => Get.toNamed(Routes.TABLES),
                  child: const Text("Select Table"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
