import 'package:pos_server/src/article/article_composition_endpoint.dart';
import 'package:pos_server/src/cateogrie/categorie_endpoint.dart';

import '../helpers/session_extensions.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ArticleEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get Articles by building id
  /// required [buildingId] buildingId The id of the building
  /// optional [categoryId] The id of the category
  /// Returns a list of [Article] articles
  Future<List<Article>> getArticlesByBuildingId(
    Session session,
    UuidValue buildingId, {
    UuidValue? categoryId,
  }) async {
    return await Article.db.find(
      session,
      include: Article.include(
        categorie: Categorie.include(),
      ),
      where: (a) {
        final base = a.categorie.buildingId.equals(buildingId);
        if (categoryId != null) {
          return base & a.categorieId.equals(categoryId);
        }
        return a.categorie.buildingId.equals(buildingId);
      },
    );
  }

  /// Create new article
  /// required [article] The article to create
  /// Returns the created [Article] article
  /// allow for admin users only
  Future<Article> createArticle(
    Session session,
    Article article,
  ) async {
    return await session.db.transaction((transaction) async {
      session.authorizedTo(['owner']);
      await _checkArticleNameExist(
        session,
        article.name,
        article.categorie!.buildingId,
      );
      Article newArticle = await Article.db.insertRow(
        session,
        article,
        transaction: transaction,
      );
      List<ArticleComposition> compositions = <ArticleComposition>[];
      if (article.composition != null && article.composition!.isNotEmpty) {
        compositions = await ArticleCompositionEndpoint()
            .createArticleComposition(
              session,
              newArticle.id,
              article.composition!,
              transaction: transaction,
            );
      }
      await Article.db.attach.composition(
        session,
        newArticle,
        compositions,
        transaction: transaction,
      );
      newArticle.composition = compositions;
      return newArticle;
    });
  }

  @doNotGenerate
  Future<void> _checkArticleNameExist(
    Session session,
    String name,
    UuidValue buildingId,
  ) async {
    final existe = await Article.db.findFirstRow(
      session,
      where: (a) =>
          a.name.ilike(name) & a.categorie.buildingId.equals(buildingId),
    );
    if (existe != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Article with name $name already exists',
      );
    }
  }

  /// Get article by id
  /// required [articleId] The id of the article
  /// Returns the [Article] article
  Future<Article> getArticleById(Session session, UuidValue id) async {
    Article? article = await Article.db.findById(
      session,
      id,
      include: Article.include(
        categorie: Categorie.include(),
        composition: ArticleComposition.includeList(
          include: ArticleComposition.include(
            ingredient: Ingredient.include(),
          ),
        ),
      ),
    );
    if (article == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Article not found',
      );
    }
    return article;
  }

  /// Update article
  /// required [article] The article to update
  /// Returns the updated [Article] article
  /// allow for owner users only
  Future<Article> updateArticle(
    Session session,
    UuidValue id,
    Article article,
  ) async {
    session.authorizedTo(['owner']);
    final existingArticle = await getArticleById(session, id);
    if (existingArticle.name != article.name) {
      await _checkArticleNameExist(
        session,
        article.name,
        existingArticle.categorie!.buildingId,
      );
    }
    if (existingArticle.categorieId != article.categorieId) {
      final categorie = await CategorieEndpoint().getCategorieById(
        session,
        article.categorieId,
      );
      existingArticle.categorie = categorie;
      existingArticle.categorieId = categorie.id;
    }
    existingArticle.name = article.name;
    existingArticle.description = article.description;
    existingArticle.price = article.price;
    return await Article.db.updateRow(
      session,
      existingArticle,
    );
  }
}
