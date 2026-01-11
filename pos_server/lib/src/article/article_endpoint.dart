import 'package:pos_server/src/helpers/authorizations_helpers.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ArticleEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get Articles by building id
  /// required [buildingId] buildingId The id of the building
  /// optional [categoryId] The id of the category
  /// Returns a list of [Article] articles
  /// allow for all type of users (admin, employee, customer)
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

  /// Create new article
  /// required [article] The article to create
  /// required [buildingId] buildingId The id of the building
  /// Returns the created [Article] article
  /// allow for admin users only
  Future<Article> createArticle(
    Session session, {
    required Article article,
    required int buildingId,
  }) async {
    await AuthorizationsHelpers().requiredScopes(session, ["admin"]);
    final existe = await Article.db.findFirstRow(
      session,
      where: (a) =>
          a.name.ilike(article.name) &
          a.categorie.buildingId.equals(buildingId),
    );
    if (existe != null) throw Exception('Article already exists');
    return await Article.db.insertRow(
      session,
      article,
    );
  }

  @doNotGenerate
  Future<Article> getArticleById(
    Session session,
    int articleId,
    int buildingId,
  ) async {
    Article? article = await Article.db.findFirstRow(
      session,
      where: (a) =>
          a.id.equals(articleId) & a.categorie.buildingId.equals(buildingId),
    );
    if (article == null) {
      throw Exception('Article with id $articleId not found');
    }
    return article;
  }
}
