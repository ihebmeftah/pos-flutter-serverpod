import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/article/controllers/article_controller.dart';

import '../../../../config/serverpod_client.dart';

class ArticleFormController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  final artFormKey = GlobalKey<FormState>();
  final name = TextEditingController(),
      description = TextEditingController(),
      price = TextEditingController();
  Categorie? selectedCategory;
  Article get articleDto => Article(
    name: name.text,
    description: description.text,
    price: double.parse(price.text),
    categorieId: selectedCategory!.id!,
    categorie: selectedCategory,
  );
  void createArticle() async {
    try {
      if (artFormKey.currentState!.validate()) {
        await ServerpodClient.instance.article.createArticle(
          article: articleDto,
          buildingId: LocalStorage().building!.id!,
        );
        Get.find<ArticleController>().getArticles();
        Get.back();
      }
    } on AppException catch (e) {
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
