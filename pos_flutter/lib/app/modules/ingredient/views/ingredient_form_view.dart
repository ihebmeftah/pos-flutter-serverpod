import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';

import '../../../components/appdropdown.dart';
import '../../../components/appformfield.dart';
import '../controllers/ingredient_form_controller.dart';

class IngredientFormView extends GetView<IngredientFormController> {
  const IngredientFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('IngredientFormView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (s) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: controller.ingFormKey,
                  child: AppSectionCard(
                    title: "Ingredient Details",
                    child: Column(
                      spacing: 20,
                      children: [
                        AppFormField.label(
                          label: "Ingredient Name",
                          hint: "Enter ingredient name",
                          ctr: controller.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                        AppDropdown.label(
                          items: UnitsType.values
                              .map(
                                (e) => DropdownMenuItem<UnitsType>(
                                  value: e,
                                  child: Text(e.name),
                                ),
                              )
                              .toList(),
                          selectedItem: controller.selectedUnit,
                          onChanged: controller.selectUnit,
                          label: "Unit Type",
                          hint: "Select unit type",
                          validator: (value) {
                            if (value == null) {
                              return "Unit type is required";
                            }
                            return null;
                          },
                        ),
                        AppFormField.label(
                          label: "Current Stock",
                          hint: "Enter current stock",
                          ctr: controller.currentStock,
                          isNumeric: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Current stock is required";
                            }
                            if (num.tryParse(value) == null) {
                              return "Enter a valid number";
                            }
                            return null;
                          },
                        ),
                        AppFormField.label(
                          label: "Threshold Stock",
                          hint: "Enter threshold stock",
                          ctr: controller.thresholdStock,
                          isNumeric: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Threshold stock is required";
                            }
                            if (num.tryParse(value) == null) {
                              return "Enter a valid number";
                            }
                            if (double.tryParse(
                                  controller.thresholdStock.text,
                                )! >
                                double.tryParse(
                                  controller.currentStock.text,
                                )!) {
                              return "Threshold stock cannot be greater than current stock";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: ElevatedButton(
                onPressed: controller.createIngredient,
                child: const Text("Add Ingredient"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
