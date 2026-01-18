import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class IngredientController extends GetxController with StateMixin {
  final ingredients = <Ingredient>[].obs;
  @override
  void onInit() async {
    await getIngredients();
    super.onInit();
  }

  Future<void> getIngredients() async {
    try {
      ingredients(await ServerpodClient.instance.ingredient.getIngredientsByBuildingId(
        LocalStorage().building!.id
      ));
      if (ingredients.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(ingredients, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
  }