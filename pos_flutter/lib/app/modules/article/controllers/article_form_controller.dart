import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/modules/article/controllers/article_controller.dart';

import '../../../../config/serverpod_client.dart';
import '../../categorie/controllers/categorie_controller.dart';

class ArticleFormController extends GetxController with StateMixin {
  final categorieController = Get.put<CategorieController>(
    CategorieController(),
  );
  UuidValue? get id => Get.parameters['id'] != null
      ? UuidValue.fromString(Get.parameters['id']!)
      : null;
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

  final artFormKey = GlobalKey<FormState>();
  final name = TextEditingController(),
      description = TextEditingController(),
      price = TextEditingController();
  Categorie? selectedCategory;

  Article get articleDto => Article(
    id: id,
    name: name.text,
    description: description.text,
    price: double.parse(price.text),
    categorieId: selectedCategory!.id,
    categorie: selectedCategory,
  );

  Future<void> getArticleById() async {
    try {
      change(null, status: RxStatus.loading());
      final article = await ServerpodClient.instance.article.getArticleById(
        id!,
      );
      name.text = article.name;
      description.text = article.description ?? "";
      price.text = article.price.toString();
      await categorieController.getCategories();
      selectedCategory = categorieController.categories.firstWhereOrNull(
        (cat) => cat.id == article.categorieId,
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
          await ServerpodClient.instance.article.createArticle(articleDto);
        } else {
          await ServerpodClient.instance.article.updateArticle(
            article: articleDto,
          );
        }
        AppSnackbar.success();
        Get.find<ArticleController>().getArticles();
        Get.back();
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Conflict) {
        AppSnackbar.info(
          "Article with the name ${articleDto.name} already exists",
        );
        change([], status: RxStatus.success());
        return;
      }
      change([], status: RxStatus.error(e.message));
    } catch (e) {
      change([], status: RxStatus.error("Failed to create article"));
    }
  }

  void selectCategorie(Categorie? category) {
    if (category != null) {
      selectedCategory = category;
    }
  }
}
