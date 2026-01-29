import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../data/local/local_storage.dart';
import '../../../extensions/currency.extension.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/apptheme.dart';
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
        padding: const EdgeInsets.all(20.0),
        child: controller.obx(
          (s) => Column(
            spacing: 20,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  spacing: 12,
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme().primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/svg/table.svg",
                        width: 28,
                        colorFilter: ColorFilter.mode(
                          AppTheme().primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      'Table ${controller.table!.number}',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton.outlined(
                      onPressed: () => Get.toNamed(Routes.TABLES),
                      icon: Icon(
                        Icons.sync,
                        color: AppTheme().primary,
                      ),
                      tooltip: "Change Table",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: GetBuilder<PassOrderController>(
                    id: "selectedArticles",
                    builder: (_) {
                      return controller.selectedArticles.isEmpty
                          ? Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .center,
                              spacing: 16,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 48,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Text(
                                  "No Items Added",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "Start adding articles to this order",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme().primary,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () => Get.toNamed(Routes.ARTICLE),
                                  icon: const Icon(Icons.add_circle_outline),
                                  label: const Text(
                                    "Add Articles",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              spacing: 12,
                              crossAxisAlignment: .start,
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Icon(
                                          Icons.receipt_long,
                                          size: 20,
                                          color: AppTheme().primary,
                                        ),
                                        Text(
                                          "Order Items",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppTheme().primary.withValues(
                                          alpha: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "${controller.selectedArticles.length} ${controller.selectedArticles.length == 1 ? 'item' : 'items'}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme().primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(height: 1),
                                Expanded(
                                  child: Scrollbar(
                                    thumbVisibility: true,
                                    child: ListView.separated(
                                      itemCount: controller
                                          .selectedArticleWithOcc
                                          .length,
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            height: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                      itemBuilder: (context, index) {
                                        final item = controller
                                            .selectedArticleWithOcc[index];
                                        return ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                          leading: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppTheme().primary
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "×${item.occurrence}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: AppTheme().primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            item.article.name.capitalize!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "${item.article.price} ${LocalStorage().building!.currencyCode.symbol}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () =>
                                                controller.removeArticle(
                                                  item.article,
                                                ),
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.red,
                                              size: 22,
                                            ),
                                            tooltip: "Remove",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    TextButton.icon(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.red,
                                      ),
                                      onPressed: controller.clearAllArticles,
                                      icon: const Icon(
                                        Icons.clear_all,
                                        size: 18,
                                      ),
                                      label: const Text(
                                        "Clear All",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppTheme().primary,
                                      ),
                                      onPressed: () =>
                                          Get.toNamed(Routes.ARTICLE),
                                      icon: const Icon(Icons.add, size: 18),
                                      label: const Text(
                                        "Add More",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
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
                spacing: 12,
                crossAxisAlignment: .start,
                children: [
                  if (controller.table!.status == TableStatus.occupied &&
                      LocalStorage().building!.tableMultiOrder == false)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.orange.shade200,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.orange.shade700,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  "Table Occupied",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "Adding items to existing order",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            GetBuilder<PassOrderController>(
                              id: "selectedArticles",
                              builder: (passOrderCtr) {
                                return Text(
                                  "${passOrderCtr.selectedArticles.fold<num>(0, (sum, article) => sum + article.price).toStringAsFixed(2)} ${LocalStorage().building!.currencyCode.symbol}",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme().primary,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        GetBuilder<PassOrderController>(
                          id: "selectedArticles",
                          builder: (_) {
                            return ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme().primary,
                                foregroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                disabledBackgroundColor: Colors.grey.shade300,
                                disabledForegroundColor: Colors.grey.shade500,
                              ),
                              onPressed: controller.selectedArticles.isEmpty
                                  ? null
                                  : controller.passOrder,
                              icon: const Icon(
                                Icons.check_circle_outline,
                                size: 22,
                              ),
                              label: const Text(
                                "Confirm Order",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          onEmpty: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                spacing: 20,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme().primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.table_restaurant,
                      size: 60,
                      color: AppTheme().primary,
                    ),
                  ),
                  Text(
                    "No Table Selected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Please select a table to start\ntaking an order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme().primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.TABLES),
                      icon: const Icon(Icons.touch_app),
                      label: const Text(
                        "Select Table",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black26)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.black26)),
                    ],
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme().primary,
                      side: BorderSide(color: AppTheme().primary, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Get.toNamed(Routes.QRSCAN),
                    icon: const Icon(Icons.qr_code_scanner, size: 24),
                    label: const Text(
                      "Scan Table QR Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
