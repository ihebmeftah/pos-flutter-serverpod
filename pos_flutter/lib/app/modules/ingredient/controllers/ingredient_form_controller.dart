import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/components/app_snackbar.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

import '../../../data/local/local_storage.dart';
import 'ingredient_controller.dart';

class IngredientFormController extends GetxController with StateMixin {
  final UuidValue? id = Get.parameters['id'] != null
      ? UuidValue.fromString(Get.parameters['id']!)
      : null;

  @override
  void onInit() async {
    if (id != null) {
      await getIngredintById();
    } else {
      change(null, status: RxStatus.success());
    }
    super.onInit();
  }

  final ingFormKey = GlobalKey<FormState>();
  final name = TextEditingController(),
      currentStock = TextEditingController(),
      minimumStock = TextEditingController();
  UnitsType? selectedUnit;

  void selectUnit(UnitsType? unit) {
    selectedUnit = unit;
  }

  Ingredient get ingredientDto => Ingredient(
    id: id,
    name: name.text,
    unit: selectedUnit!,
    currentStock: double.parse(currentStock.text),
    thresholdStock: double.parse(minimumStock.text),
    buildingId: LocalStorage().building!.id,
  );

  void createIngredient() async {
    try {
      if (ingFormKey.currentState!.validate()) {
        await ServerpodClient.instance.ingredient.createIngredient(
          ingredientDto,
        );
        await Get.find<IngredientController>().getIngredients();
        Get.back();
      }
    } on AppException catch (e) {
      AppSnackbar.info(e.message);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> getIngredintById() async {
    try {
      final ingredient = await ServerpodClient.instance.ingredient
          .getIngredintById(id!);
      name.text = ingredient.name;
      currentStock.text = ingredient.currentStock.toString();
      minimumStock.text = ingredient.thresholdStock.toString();
      selectedUnit = ingredient.unit;
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
