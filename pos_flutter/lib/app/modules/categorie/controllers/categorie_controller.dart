import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';
import 'package:pos_flutter/app/data/local/local_storage.dart';
import 'package:pos_flutter/config/serverpod_client.dart';

class CategorieController extends GetxController
    with StateMixin<List<Categorie>> {
  final categories = <Categorie>[].obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future getCategories() async {
    try {
      change([], status: RxStatus.loading());
      categories(
        await ServerpodClient.instance.categorie.getCategories(
          LocalStorage().building!.id,
        ),
      );
      if (categories.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(categories, status: RxStatus.success());
      }
    } catch (e) {
      change([], status: RxStatus.error('Failed to load categories'));
    }
  }
}
