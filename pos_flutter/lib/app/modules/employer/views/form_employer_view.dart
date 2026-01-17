import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';
import 'package:pos_flutter/app/components/appdropdown.dart';
import 'package:pos_flutter/app/modules/access/controllers/access_controller.dart';

import '../../../components/apperrorscreen.dart';
import '../../../components/appformfield.dart';
import '../controllers/form_employer_controller.dart';

class FormEmployerView extends GetView<FormEmployerController> {
  const FormEmployerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Add Employer'), centerTitle: true),
      body: controller.obx(
        (_) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    child: AppSectionCard(
                      title: 'Employer Information',
                      icon: Icons.person_add_outlined,
                      child: Column(
                        spacing: 10,
                        children: [
                          //  FileuploadView(uploadType: UploadType.image),
                          Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: AppFormField.label(
                                  label: "First Name",
                                  hint: "Enter first name",
                                  ctr: controller.fname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "First Name is required";
                                    }
                                    return null;
                                  },
                                  onChanged: controller.onChangeFirstLastName,
                                ),
                              ),
                              Expanded(
                                child: AppFormField.label(
                                  label: "Last Name",
                                  hint: "Enter last name",
                                  ctr: controller.lname,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Last Name is required";
                                    }
                                    return null;
                                  },
                                  onChanged: controller.onChangeFirstLastName,
                                ),
                              ),
                            ],
                          ),
                          AppFormField.label(
                            readOnly: true,
                            label: "Display Name",
                            hint: "Enter Display Name",
                            ctr: controller.displayName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Display Name is required";
                              }
                              return null;
                            },
                          ),
                          AppFormField.label(
                            label: "Personal Email",
                            hint: "Enter personal email",
                            ctr: controller.persoEmail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Personal Email is required";
                              }
                              if (!GetUtils.isEmail(value)) {
                                return "Invalid personal email format";
                              }
                              return null;
                            },
                          ),
                          AppFormField.label(
                            label: "Phone",
                            hint: "Ex: +21712345678",
                            ctr: controller.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Phone number is required";
                              }
                              if (!GetUtils.isPhoneNumber(value)) {
                                return "Invalid phone number format";
                              }
                              return null;
                            },
                          ),
                          AppFormField.label(
                            label: "Password",
                            hint: "Enter password",
                            ctr: controller.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                          ),
                          GetBuilder<AccessController>(
                            init: AccessController(),
                            builder: (ctr) {
                              return GetBuilder<FormEmployerController>(
                                id: "accessDropdown",
                                builder: (_) {
                                  return AppDropdown<Access>.label(
                                    onDelete: controller.removeAccess,
                                    selectedItem: controller.selectedAccess,
                                    items: ctr.access
                                        .map(
                                          (e) => DropdownMenuItem<Access>(
                                            value: e,
                                            child: Text(e.name.capitalize!),
                                          ),
                                        )
                                        .toList(),
                                    label: "Access",
                                    hint: "Select access",
                                    onChanged: controller.selectAccess,
                                  );
                                },
                              );
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
                  onPressed: controller.createEmployyer,
                  child: const Text("Add Employer"),
                ),
              ),
            ],
          );
        },
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
