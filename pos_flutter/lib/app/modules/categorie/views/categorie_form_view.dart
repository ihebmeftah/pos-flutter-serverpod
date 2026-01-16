import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';
import 'package:pos_flutter/app/components/apperrorscreen.dart';

import '../../../components/appformfield.dart';
import '../controllers/categorie_form_controller.dart';

class CategorieFormView extends GetView<CategorieFormController> {
  const CategorieFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Create categorie')),
      body: controller.obx(
        (s) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: controller.catFormKey,
                  child: AppSectionCard(
                    title: 'Category Information',
                    icon: Icons.category_outlined,
                    child: Column(
                      spacing: 20,
                      children: [
                        //FileuploadView(uploadType: UploadType.image),
                        AppFormField.label(
                          label: "Category Name",
                          hint: "Enter Category name",
                          ctr: controller.nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                        AppFormField.label(
                          label: "Description",
                          hint: "Enter Category description",
                          minLines: 3,
                          ctr: controller.descController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: ElevatedButton(
                onPressed: controller.craeteCategory,
                child: const Text("Add Category"),
              ),
            ),
          ],
        ),
        onError: (error) => AppErrorScreen(message: error),
      ),
    );
  }
}
