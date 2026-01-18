import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';
import 'package:pos_flutter/app/components/app_switchtile.dart';
import 'package:pos_flutter/app/components/appdropdown.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';

import '../../../components/appformfield.dart';
import '../controllers/form_building_controller.dart';

class FormBuildingView extends GetView<FormBuildingController> {
  const FormBuildingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(controller.id != null ? 'Edit Building' : 'Add Building'),
        centerTitle: true,
      ),
      body: controller.obx(
        (s) => Column(
          spacing: 20,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: controller.addFormkey,
                  child: Column(
                    spacing: 20,
                    children: [
                      //        FileuploadView(uploadType: UploadType.image),
                      AppSectionCard(
                        title: 'Building Information',
                        icon: Icons.apartment_outlined,
                        child: Column(
                          spacing: 10,
                          children: [
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
                                      onPressed: controller
                                          .determinAddresBasedonCurrLocation,
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
                          ],
                        ),
                      ),
                      AppSectionCard(
                        title: 'Building Settings',
                        icon: Icons.settings_outlined,
                        child: Column(
                          spacing: 10,
                          children: [
                            GetBuilder<FormBuildingController>(
                              id: 'strictMode',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: ("Strict Mode"),
                                  description:
                                      "Enforce strict order and payment protocols",
                                  value: controller.strictMode,
                                  onChanged: controller.changeStrictMode,
                                );
                              },
                            ),
                            GetBuilder<FormBuildingController>(
                              id: 'tableMultiOrder',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: ("Multi order per table"),
                                  description:
                                      "Allow multiple orders to be placed at the same table in the same time",

                                  value: controller.tableMultiOrder,
                                  onChanged: controller.changeTableMultiOrder,
                                );
                              },
                            ),
                            GetBuilder<FormBuildingController>(
                              id: 'allowAppendingItemsToOrder',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: ("Appending Items to Order"),
                                  description:
                                      "Allow adding more items to an existing order",
                                  value: controller.allowAppendingItemsToOrder,
                                  onChanged: controller
                                      .changeAllowAppendingItemsToOrder,
                                );
                              },
                            ),
                            GetBuilder<FormBuildingController>(
                              id: 'autoCloseOrdersAtClosingTime',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: ("Close Orders"),
                                  description:
                                      "Automatically close orders at closing time",
                                  value:
                                      controller.autoCloseOrdersAtClosingTime,
                                  onChanged: controller
                                      .changeAutoCloseOrdersAtClosingTime,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      AppSectionCard(
                        title: 'Public settings',
                        icon: Icons.settings_outlined,
                        child: Column(
                          spacing: 10,
                          children: [
                            GetBuilder<FormBuildingController>(
                              id: 'active',
                              builder: (_) {
                                return AppSwitchtile(
                                  title: ("Active"),
                                  description:
                                      "Make this building available for customers",
                                  value: controller.active,
                                  onChanged: controller.changeActive,
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      //    FileuploadView(),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: ElevatedButton(
                onPressed: controller.addBuilding,
                child: Text(
                  controller.id == null ? "Add Building" : "Update Building",
                ),
              ),
            ),
          ],
        ),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
