import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/article/controllers/article_controller.dart';

import '../../../../config/serverpod_client.dart';
import '../../../components/appdropdown.dart';
import '../../../components/appformfield.dart';
import '../../categorie/controllers/categorie_controller.dart';
import '../../ingredient/controllers/ingredient_controller.dart';

class ArticleFormController extends GetxController with StateMixin {
  final categorieController = Get.put<CategorieController>(
    CategorieController(),
  );
  UuidValue? get id => Get.parameters['id'] != null
      ? UuidValue.fromString(Get.parameters['id']!)
      : null;

  /// The article being edited, null if creating a new article
  Article? article;

  /// Forms and Controllers
  final artFormKey = GlobalKey<FormState>();
  final name = TextEditingController(),
      description = TextEditingController(),
      price = TextEditingController();
  Categorie? selectedCategory;

  @override
  void onInit() async {
    await categorieController.getCategories();
    if (id != null) {
      await getArticleById();
    } else {
      change(null, status: RxStatus.success());
    }
    super.onInit();
  }

  CreateArticleDto get createArticleDto => CreateArticleDto(
    name: name.text,
    description: description.text,
    price: double.parse(price.text),
    categoryId: selectedCategory!.id,
    buildingId: LocalStorage().building!.id,
    composition: articleCompositions.toList(),
  );

  UpdateArticleDto get updateArticleDto => UpdateArticleDto(
    name: name.text,
    description: description.text,
    price: double.parse(price.text),
    categoryId: selectedCategory!.id,
  );

  Future<void> getArticleById() async {
    try {
      change(null, status: RxStatus.loading());
      article = await ServerpodClient.instance.article.getArticleById(
        id!,
        LocalStorage().building!.id,
      );
      name.text = article!.name;
      description.text = article!.description ?? '';
      price.text = article!.price.toString();
      selectedCategory = categorieController.categories.firstWhere(
        (cat) => cat.id == article!.categorieId,
      );
      change(article, status: RxStatus.success());
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to load Article"));
    }
  }

  void createArticle() async {
    try {
      if (artFormKey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        if (id == null) {
          await ServerpodClient.instance.article.createArticle(
            createArticleDto,
          );
        } else {
          await ServerpodClient.instance.article.updateArticle(
            id!,
            LocalStorage().building!.id,
            updateArticleDto,
          );
        }
        AppSnackbar.success();
        Get.find<ArticleController>().getArticles();
        Get.back();
      }
    } on AppException catch (e) {
      AppSnackbar.info(e.message);
      change([], status: RxStatus.success());
      return;
    } catch (e) {
      change([], status: RxStatus.error("Failed to create article"));
    }
  }

  void selectCategorie(Categorie? category) {
    if (category != null) {
      selectedCategory = category;
    }
  }

  final articleCompositions = <ArticleComposition>[].obs;
  void addComposition() {
    Ingredient? selectedIngredient;
    final quantityController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            children: [
              GetBuilder<IngredientController>(
                init: IngredientController(),
                builder: (ingradientController) {
                  return AppDropdown.label(
                    selectedItem: selectedIngredient,
                    onChanged: (value) => selectedIngredient = value,
                    label: "Ingradient",
                    hint: "Select Ingradient",
                    items: ingradientController.ingredients
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              "${e.name} - (Unit: ${e.unit})",
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return "Ingradient is required";
                      }
                      return null;
                    },
                  );
                },
              ),
              AppFormField.label(
                ctr: quantityController,
                buildCounter:
                    (
                      context, {
                      required currentLength,
                      required isFocused,
                      required maxLength,
                    }) => Text(
                      "Verify entered quantity based on unit of selected ingredient for accuracy.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                label: "Quantity",
                hint: "Enter quantity",
                isNumeric: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Quantity is required";
                  }
                  if (!GetUtils.isNum(value)) {
                    return "Quantity must be a number";
                  }
                  return null;
                },
              ),
              SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      articleCompositions.add(
                        ArticleComposition(
                          ingredientId: selectedIngredient!.id,
                          ingredient: selectedIngredient,
                          quantity: double.parse(quantityController.text),
                        ),
                      );
                      Get.back();
                    }
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
