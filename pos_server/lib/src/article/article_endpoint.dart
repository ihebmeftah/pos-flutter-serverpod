import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ArticleEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Article>> getArticles(
    Session session,
    int buildingId, {
    int? categoryId,
  }) async {
    if (categoryId != null) {
      return await Article.db.find(
        session,
        include: Article.include(
          categorie: Categorie.include(),
        ),
        where: (a) =>
            a.categorie.buildingId.equals(buildingId) &
            a.categorie.id.equals(
              categoryId,
            ),
      );
    }
    return await Article.db.find(
      session,
      include: Article.include(
        categorie: Categorie.include(),
      ),
      where: (a) => a.categorie.buildingId.equals(buildingId),
    );
  }

  Future<Article> createArticle(
    Session session, {
    required Article article,
    required int buildingId,
  }) async {
    final existe = await Article.db.findFirstRow(
      session,
      where: (a) =>
          a.name.equals(article.name) &
          a.categorie.buildingId.equals(buildingId),
    );
    if (existe != null) throw Exception('Article already exists');
    return await Article.db.insertRow(
      session,
      article,
    );
  }
}
