import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/app_section_card.dart';
import '../../../components/app_switchtile.dart';
import '../../../components/appformfield.dart';
import '../controllers/access_form_controller.dart';

class AccessFormView extends GetView<AccessFormController> {
  const AccessFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          controller.id != null ? 'Edit Access' : 'Create Access',
        ),
      ),
      body: controller.obx(
        (s) => Column(
          spacing: 20,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    spacing: 24,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Access Name Field
                      AppSectionCard(
                        title: 'Basic Information',
                        icon: Icons.info_outline,
                        child: AppFormField.label(
                          label: "Access Name",
                          hint: "e.g., Manager, Waiter, Chef",
                          ctr: controller.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Access name is required";
                            }
                            return null;
                          },
                        ),
                      ),

                      // Order Permissions Section
                      AppSectionCard(
                        title: 'Order Permissions',
                        icon: Icons.receipt_long_outlined,
                        child: Column(
                          spacing: 8,
                          children: [
                            GetBuilder<AccessFormController>(
                              id: 'orderCreation',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Create Orders',
                                  description: 'Allow creating new orders',
                                  value: controller.orderCreation,
                                  onChanged: controller.updateOrderCreation,
                                );
                              },
                            ),
                            GetBuilder<AccessFormController>(
                              id: 'orderCreationNotif',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Order Notifications',
                                  description: 'Receive alerts for new orders',
                                  value: controller.orderCreationNotif,
                                  onChanged:
                                      controller.updateOrderCreationNotif,
                                );
                              },
                            ),
                            GetBuilder<AccessFormController>(
                              id: 'consultAllOrders',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'View All Orders',
                                  description: 'See orders from all users',
                                  value: controller.consultAllOrders,
                                  onChanged: controller.updateConsultAllOrders,
                                );
                              },
                            ),
                            GetBuilder<AccessFormController>(
                              id: 'appendItems',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Modify Orders',
                                  description: 'Add items to existing orders',
                                  value: controller.appendItems,
                                  onChanged: controller.updateAppendItems,
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // Payment Permissions Section
                      AppSectionCard(
                        title: 'Payment Permissions',
                        icon: Icons.payments_outlined,
                        child: Column(
                          spacing: 8,
                          children: [
                            GetBuilder<AccessFormController>(
                              id: 'orderPayment',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Process Payments',
                                  description: 'Complete order payments',
                                  value: controller.orderPayment,
                                  onChanged: controller.updateOrderPayment,
                                );
                              },
                            ),
                            GetBuilder<AccessFormController>(
                              id: 'orderItemsPayment',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Item-Level Payment',
                                  description: 'Pay for individual items',
                                  value: controller.orderItemsPayment,
                                  onChanged: controller.updateOrderItemsPayment,
                                );
                              },
                            ),
                            GetBuilder<AccessFormController>(
                              id: 'caisseManagement',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Manage Cash Register',
                                  description: 'Access cash register controls',
                                  value: controller.caisseManagement,
                                  onChanged: controller.updateCaisseManagement,
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // Kitchen Permissions Section
                      AppSectionCard(
                        title: 'Kitchen Permissions',
                        icon: Icons.restaurant_outlined,
                        child: Column(
                          spacing: 8,
                          children: [
                            GetBuilder<AccessFormController>(
                              id: 'preparation',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Prepare Orders',
                                  description: 'Mark items as prepared',
                                  value: controller.preparation,
                                  onChanged: controller.updatePreparation,
                                );
                              },
                            ),
                            GetBuilder<AccessFormController>(
                              id: 'takeOrder',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: 'Serve Orders',
                                  description: 'Mark items as served',
                                  value: controller.takeOrder,
                                  onChanged: controller.updateTakeOrder,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Fixed Bottom Button
            SafeArea(
              child: ElevatedButton(
                onPressed: controller.createAccess,
                child: Text(
                  controller.id == null ? "Create Access" : "Update Access",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
