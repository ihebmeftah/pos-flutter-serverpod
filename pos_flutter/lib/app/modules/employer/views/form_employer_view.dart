import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/apperrorscreen.dart';
import '../../../components/appformfield.dart';
import '../controllers/form_employer_controller.dart';

class FormEmployerView extends GetView<FormEmployerController> {
  const FormEmployerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employer'), centerTitle: true),
      body: controller.obx(
        (_) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                spacing: 20,
                children: [
                  //  FileuploadView(uploadType: UploadType.image),
                  AppFormField.label(
                    label: "Fulll Name",
                    hint: "Enter full name",
                    ctr: controller.fname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Full Name is required";
                      }
                      return null;
                    },
                  ),
                  AppFormField.label(
                    label: "Email",
                    hint: "Enter email",
                    ctr: controller.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!GetUtils.isEmail(value)) {
                        return "Invalid email format";
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

                  const Spacer(),
                  ElevatedButton(
                    onPressed: controller.createEmployyer,
                    child: const Text("Add Employer"),
                  ),
                ],
              ),
            ),
          );
        },
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
