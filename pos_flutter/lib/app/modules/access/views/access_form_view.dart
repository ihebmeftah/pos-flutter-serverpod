import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appformfield.dart';
import '../controllers/access_form_controller.dart';

class AccessFormView extends GetView<AccessFormController> {
  const AccessFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.id != null ? 'Edit Access' : 'Create Access',
        ),
      ),
      body: controller.obx(
        (s) => SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              spacing: 20,
              children: [
                Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFormField.label(
                      label: "Name",
                      hint: "Enter access name",
                      ctr: controller.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                    Text(
                      "Order permission : ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GetBuilder<AccessFormController>(
                      id: 'orderCreation',
                      builder: (context) {
                        return CheckboxListTile(
                          title: Text("Order Creation"),
                          subtitle: Text("User able to create order"),
                          value: controller.orderCreation,
                          onChanged: controller.updateOrderCreation,
                        );
                      },
                    ),
                    GetBuilder<AccessFormController>(
                      id: 'orderCreationNotif',
                      builder: (context) {
                        return CheckboxListTile(
                          title: Text("Order Creation Notification"),
                          subtitle: Text(
                            "User will receive notification on new order creation",
                          ),
                          value: controller.orderCreationNotif,
                          onChanged: controller.updateOrderCreationNotif,
                        );
                      },
                    ),
                    GetBuilder<AccessFormController>(
                      id: 'orderPayment',
                      builder: (context) {
                        return CheckboxListTile(
                          title: Text("Order Payment"),
                          subtitle: Text("User able to pay order"),
                          value: controller.orderPayment,
                          onChanged: controller.updateOrderPayment,
                        );
                      },
                    ),
                    GetBuilder<AccessFormController>(
                      id: 'orderItemsPayment',
                      builder: (context) {
                        return CheckboxListTile(
                          title: Text("Order Items Payment"),
                          subtitle: Text("User able to pay order items"),
                          value: controller.orderItemsPayment,
                          onChanged: controller.updateOrderItemsPayment,
                        );
                      },
                    ),
                    GetBuilder<AccessFormController>(
                      id: 'consultAllOrders',
                      builder: (context) {
                        return CheckboxListTile(
                          title: Text("Consult All Orders"),
                          subtitle: Text(
                            "If disable user can only see his orders",
                          ),
                          value: controller.consultAllOrders,
                          onChanged: controller.updateConsultAllOrders,
                        );
                      },
                    ),
                  ],
                ),
                GetBuilder<AccessFormController>(
                  id: 'takeOrder',
                  builder: (context) {
                    return CheckboxListTile(
                      title: Text("Take Order"),
                      subtitle: Text(
                        "Allowed to make items as served",
                      ),
                      value: controller.takeOrder,
                      onChanged: controller.updateTakeOrder,
                    );
                  },
                ),
                GetBuilder<AccessFormController>(
                  id: 'appendItems',
                  builder: (context) {
                    return CheckboxListTile(
                      title: Text("Append Items to Order"),
                      subtitle: Text(
                        "User able to append items to existing order",
                      ),
                      value: controller.appendItems,
                      onChanged: controller.updateAppendItems,
                    );
                  },
                ),
                GetBuilder<AccessFormController>(
                  id: 'preparation',
                  builder: (context) {
                    return CheckboxListTile(
                      title: Text("Order Preparation"),
                      subtitle: Text("User able to prepare order items"),
                      value: controller.preparation,
                      onChanged: controller.updatePreparation,
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: controller.createAccess,
                  child: Text(
                    controller.id == null ? "Create Access" : "Update Access",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
