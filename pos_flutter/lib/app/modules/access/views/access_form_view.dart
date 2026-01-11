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
        title: const Text('Add Access'),
      ),
      body: controller.obx(
        (s) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
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
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: controller.createAccess,
                child: Text('Create Access'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
