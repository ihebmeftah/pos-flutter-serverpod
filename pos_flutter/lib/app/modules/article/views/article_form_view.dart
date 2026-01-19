import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_section_card.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/extensions/currency.extension.dart';

import '../../../components/appdropdown.dart';
import '../../../components/apperrorscreen.dart';
import '../../../components/appformfield.dart';
import '../../categorie/controllers/categorie_controller.dart';
import '../controllers/article_form_controller.dart';

class ArticleFormView extends GetView<ArticleFormController> {
  const ArticleFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Create Article')),
      body: controller.obx(
        (_) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Form(
                        key: controller.artFormKey,
                        child: AppSectionCard(
                          title: 'Article Information',
                          icon: Icons.article_outlined,
                          child: Column(
                            spacing: 20,
                            children: [
                              //FileuploadView(uploadType: UploadType.image),
                              AppFormField.label(
                                label: "Article Name",
                                hint: "Enter article name",
                                ctr: controller.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Name is required";
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                spacing: 20,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: GetX<CategorieController>(
                                      builder: (catCtr) {
                                        return AppDropdown<Categorie>.label(
                                          selectedItem:
                                              controller.selectedCategory,
                                          onChanged: controller.selectCategorie,
                                          label: "Category",
                                          hint: "Select Category",
                                          items: catCtr.categories
                                              .map(
                                                (e) =>
                                                    DropdownMenuItem<Categorie>(
                                                      value: e,
                                                      child: Text(e.name),
                                                    ),
                                              )
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return "Category is required";
                                            }
                                            return null;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: AppFormField.label(
                                      suffix: Text(
                                        LocalStorage()
                                            .building!
                                            .currencyCode
                                            .symbol,
                                      ),
                                      label: "Price",
                                      hint: "Price",
                                      ctr: controller.price,
                                      isNumeric: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Price is required";
                                        }
                                        if (!GetUtils.isNum(value)) {
                                          return "Price must be a number";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              AppFormField.label(
                                label: "Description",
                                hint: "Enter article description",
                                minLines: 3,
                                ctr: controller.description,
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSectionCard(
                        title: 'Article Composition',
                        icon: Icons.article_outlined,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GetX<ArticleFormController>(
                              builder: (ctr) => Column(
                                children: List.generate(
                                  controller.articleCompositions.length,
                                  (index) {
                                    final composition =
                                        controller.articleCompositions[index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        composition.ingredient?.name ?? '',
                                      ),
                                      subtitle: Text(
                                        'Quantity: ${composition.quantity} ${composition.ingredient?.unit.name ?? ''}',
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: controller.addComposition,
                              label: Text("Add composition"),
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: ElevatedButton(
                  onPressed: controller.createArticle,
                  child: Text(
                    controller.id == null ? "Add Article" : "Update Article",
                  ),
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
