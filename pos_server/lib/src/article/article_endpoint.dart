import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:pos_server/src/cateogrie/categorie_endpoint.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../helpers/session_extensions.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../ingredient/ingredient_endpoint.dart';

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
  /// required [articleDto] The article to create
  /// Returns the created [Article] article
  /// allow for admin users only
  Future<Article> createArticle(
    Session session,
    CreateArticleDto articleDto,
  ) async {
    session.authorizedTo(['owner']);

    /// Verify that the building belongs to the authenticated user
    final building = await BuildingEndpoint().getBuildingById(
      session,
      articleDto.buildingId,
    );
    if (building.authUserId != session.authenticated!.authUserId) {
      throw AppException(
        errorType: ExceptionType.Unauthorized,
        message: 'You are not authorized to add articles to this building',
      );
    }

    /// Verify that the category exists and belongs to the building
    final categorie = await CategorieEndpoint().getCategorieById(
      session,
      articleDto.categoryId,
      building.id,
    );

    /// Verify that the article name does not already exist in the building
    await _checkArticleNameExist(
      session,
      articleDto.name,
      articleDto.buildingId,
    );

    /// Verify that all ingredients in the composition exist and belong to the building
    List<ArticleComposition> compositions = <ArticleComposition>[];
    for (ArticleComposition compo in articleDto.composition) {
      await IngredientEndpoint().getIngredintById(
        session,
        compo.ingredientId,
        building.id,
      );
      ArticleComposition articleComposition = ArticleComposition(
        ingredientId: compo.ingredientId,
        quantity: compo.quantity,
      );
      compositions.add(articleComposition);
    }

    ///after verifing existing ,  Create the article
    Article newArticle = Article(
      name: articleDto.name,
      description: articleDto.description,
      price: articleDto.price,
      categorieId: categorie.id,
      categorie: categorie,
    );
    newArticle = await Article.db.insertRow(
      session,
      newArticle,
    );

    /// Create the article compositions
    await ArticleComposition.db.insert(
      session,
      compositions.map((e) {
        /// set the article id
        e.articleId = newArticle.id;
        return e;
      }).toList(),
    );

    /// Attach compositions to the article
    await Article.db.attach.composition(
      session,
      newArticle,
      compositions,
    );
    newArticle.composition = compositions;
    return newArticle;
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
  Future<Article> getArticleById(
    Session session,
    UuidValue id,
    UuidValue buildingId,
  ) async {
    Article? article = await Article.db.findFirstRow(
      session,
      where: (a) => a.id.equals(id) & a.categorie.buildingId.equals(buildingId),
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
  /// required [articleDto] The article to update
  /// required [id] The id of the article
  /// required [buildingId] The id of the building
  /// Returns the updated [Article] article
  /// allow for owner users only
  Future<Article> updateArticle(
    Session session,
    UuidValue id,
    UuidValue buildingId,
    UpdateArticleDto articleDto,
  ) async {
    session.authorizedTo(['owner']);
    final building = await BuildingEndpoint().getBuildingById(
      session,
      buildingId,
    );
    final existingArticle = await getArticleById(session, id, building.id);
    if (existingArticle.name != articleDto.name) {
      await _checkArticleNameExist(
        session,
        articleDto.name,
        building.id,
      );
    }
    if (existingArticle.categorieId != articleDto.categoryId) {
      final categorie = await CategorieEndpoint().getCategorieById(
        session,
        articleDto.categoryId,
        building.id,
      );
      existingArticle.categorie = categorie;
      existingArticle.categorieId = categorie.id;
    }
    existingArticle.name = articleDto.name;
    existingArticle.description = articleDto.description;
    existingArticle.price = articleDto.price;
    return await Article.db.updateRow(
      session,
      existingArticle,
      columns: (cls) => [
        cls.name,
        cls.description,
        cls.price,
        cls.categorieId,
      ],
    );
  }
}
