import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/app/modules/categorie/controllers/categorie_controller.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class CategorieFormController extends GetxController with StateMixin {
  UuidValue? get id => Get.parameters['id'] != null
      ? UuidValue.fromString(Get.parameters['id']!)
      : null;

  /// The categorie being edited, null if creating a new categorie
  Categorie? categorie;
  final catFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  CreateCategorieDto get createCategorieDto => CreateCategorieDto(
    name: nameController.text,
    description: descController.text,
    buildingId: LocalStorage().building!.id,
  );
  UpdateCategorieDto get updateCategorieDto => UpdateCategorieDto(
    name: nameController.text,
    description: descController.text,
    buildingId: LocalStorage().building!.id,
  );
  @override
  void onInit() async {
    if (id != null) {
      await getCategorieById();
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getCategorieById() async {
    try {
      change(null, status: RxStatus.loading());
      categorie = await ServerpodClient.instance.categorie.getCategorieById(
        id!,
        LocalStorage().building!.id,
      );
      nameController.text = categorie!.name;
      descController.text = categorie!.description ?? '';
      change(categorie, status: RxStatus.success());
    } on AppException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to load Category"));
    }
  }

  void craeteCategory() async {
    try {
      if (catFormKey.currentState!.validate()) {
        change(null, status: RxStatus.loading());
        if (id == null) {
          await ServerpodClient.instance.categorie.createCategorie(
            createCategorieDto,
          );
        } else {
          await ServerpodClient.instance.categorie.updateCategorie(
            categorie!.id,
            LocalStorage().building!.id,
            updateCategorieDto,
          );
        }
        AppSnackbar.success();
        Get.find<CategorieController>().getCategories();
        Get.back();
      }
    } on AppException catch (e) {
      if (e.errorType == ExceptionType.Conflict) {
        AppSnackbar.info(
          "A category with the name ${nameController.text} already exists",
        );
        change(null, status: RxStatus.success());
        return;
      }
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error("Failed to create Category"));
    }
  }
}
