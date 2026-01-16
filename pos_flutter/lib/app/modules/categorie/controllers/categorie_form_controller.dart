import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/categorie/controllers/categorie_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class CategorieFormController extends GetxController with StateMixin {
  final catFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  Categorie get categorieDto => Categorie(
    name: nameController.text,
    description: descController.text,
    buildingId: LocalStorage().building!.id!,
  );
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void craeteCategory() async {
    try {
      if (catFormKey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        await ServerpodClient.instance.categorie.createCategorie(
          categorie: categorieDto,
          buildingId: LocalStorage().building!.id!,
        );
        Get.find<CategorieController>().getCategories();
        Get.back();
      }
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to create Category"));
    }
  }
}
