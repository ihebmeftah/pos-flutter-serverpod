import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/appdropdown.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';

import '../../../components/appformfield.dart';
import '../controllers/form_building_controller.dart';

class FormBuildingView extends GetView<FormBuildingController> {
  const FormBuildingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.id != null ? 'Edit Building' : 'Add Building'),
        centerTitle: true,
      ),
      body: controller.obx(
        (s) => SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.addFormkey,
            child: Column(
              spacing: 20,
              children: [
                //        FileuploadView(uploadType: UploadType.image),
                AppFormField.label(
                  label: "Building Name",
                  hint: "Enter building name",
                  ctr: controller.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                AppFormField.label(
                  label: "Building Location",
                  hint: "Enter building location",
                  buildCounter:
                      (
                        context, {
                        required int currentLength,
                        required bool isFocused,
                        required int? maxLength,
                      }) {
                        if (!isFocused) return null;
                        return TextButton.icon(
                          onPressed:
                              controller.determinAddresBasedonCurrLocation,
                          icon: Icon(Icons.location_on_outlined),
                          label: Text(
                            'Tap here to get location (building location)',
                          ),
                        );
                      },
                  ctr: controller.location,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Location is required";
                    }
                    return null;
                  },
                ),
                AppDropdown.label(
                  selectedItem: controller.currencyCode,
                  items: Currency.values
                      .map(
                        (e) => DropdownMenuItem<Currency>(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  label: "Currency Code",
                  hint: "Select currency code",
                  onChanged: controller.changeCurrencyCode,
                  validator: (value) {
                    if (value == null) {
                      return "Currency code is required";
                    }
                    return null;
                  },
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: AppFormField.label(
                        readOnly: true,
                        onTap: controller.pickOpeningTime,
                        label: "Opening Time",
                        hint: "Pick opening time",
                        ctr: controller.opening,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Opening time is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: AppFormField.label(
                        readOnly: true,
                        onTap: controller.pickClosingTime,
                        label: "Closing Time",
                        hint: "Pick closing time",
                        ctr: controller.closing,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Closing time is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                GetBuilder<FormBuildingController>(
                  id: 'tableMultiOrder',
                  builder: (_) {
                    return SwitchListTile.adaptive(
                      title: const Text("Multi order per table"),
                      subtitle: const Text(
                        "Allow multiple orders to be placed at the same table in the same time",
                      ),
                      value: controller.tableMultiOrder,
                      onChanged: controller.changeTableMultiOrder,
                    );
                  },
                ),
                GetBuilder<FormBuildingController>(
                  id: 'allowAppendingItemsToOrder',
                  builder: (_) {
                    return SwitchListTile.adaptive(
                      title: const Text("Appending Items to Order"),
                      subtitle: const Text(
                        "Allow adding more items to an existing order",
                      ),
                      value: controller.allowAppendingItemsToOrder,
                      onChanged: controller.changeAllowAppendingItemsToOrder,
                    );
                  },
                ),
                GetBuilder<FormBuildingController>(
                  id: 'autoCloseOrdersAtClosingTime',
                  builder: (_) {
                    return SwitchListTile.adaptive(
                      title: const Text("Close Orders"),
                      subtitle: const Text(
                        "Automatically close orders at closing time",
                      ),
                      value: controller.autoCloseOrdersAtClosingTime,
                      onChanged: controller.changeAutoCloseOrdersAtClosingTime,
                    );
                  },
                ),
                //    FileuploadView(),
                ElevatedButton(
                  onPressed: controller.addBuilding,
                  child: Text(
                    controller.id == null ? "Add Building" : "Update Building",
                  ),
                ),
              ],
            ),
          ),
        ),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
