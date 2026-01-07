import 'package:get/get.dart';
import 'package:pos_client/pos_client.dart';

import '../../../../config/serverpod_client.dart';
import '../../../data/local/local_storage.dart';

class ArticleController extends GetxController with StateMixin {
  final articles = <Article>[].obs;
  @override
  void onInit() {
    getArticles();
    super.onInit();
  }

  Future getArticles() async {
    try {
      articles.value = await ServerpodClient.instance.article.getArticles(
        LocalStorage().building!.id!,
      );
      if (articles.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(articles, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load articles'));
    }
  }
}
