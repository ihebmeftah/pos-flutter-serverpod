import 'package:pos_server/src/cateogrie/categorie_endpoint.dart';

import '../helpers/session_extensions.dart';
import '../helpers/endpoint_helpers.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../ingredient/ingredient_endpoint.dart';

class ArticleEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Retrieves all articles for a specific building, optionally filtered by category.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch articles from.
  /// [categoryId] Optional category ID to filter articles.
  ///
  /// Returns a list of articles with category information included.
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
        var condition = a.categorie.buildingId.equals(buildingId);
        if (categoryId != null) {
          condition = condition & a.categorieId.equals(categoryId);
        }
        return condition;
      },
    );
  }

  /// Creates a new article with validated ingredients and category.
  /// Requires owner authorization and verifies building ownership.
  ///
  /// [session] Current user session.
  /// [articleDto] Article data including name, price, category, and composition.
  ///
  /// Returns the newly created article with compositions attached.
  Future<Article> createArticle(
    Session session,
    CreateArticleDto articleDto,
  ) async {
    session.authorizedTo(['owner']);

    // Validate building access and ownership
    final building = await EndpointHelpers.verifyBuildingAccess(
      session,
      articleDto.buildingId,
      checkOwnership: true,
    );

    // Ensure category exists and belongs to building
    final categorie = await CategorieEndpoint().getCategorieById(
      session,
      articleDto.categoryId,
      building.id,
    );

    // Check article name uniqueness within building
    await EndpointHelpers.checkArticleNameExists(
      session,
      articleDto.name,
      building.id,
    );

    // Validate all ingredients exist and belong to building
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

    // Create article with validated data
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

    // Link ingredients to article
    await ArticleComposition.db.insert(
      session,
      compositions.map((e) {
        e.articleId = newArticle.id;
        return e;
      }).toList(),
    );

    // Attach and return complete article with compositions
    await Article.db.attach.composition(
      session,
      newArticle,
      compositions,
    );
    newArticle.composition = compositions;
    return newArticle;
  }

  /// Retrieves a single article by ID with full details.
  /// Includes category and ingredient composition information.
  ///
  /// [session] Current user session.
  /// [id] Article ID to fetch.
  /// [buildingId] Building ID for access validation.
  ///
  /// Returns the article with all related data included.
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

  /// Updates an existing article's information.
  /// Validates name uniqueness if changed. Requires owner authorization.
  ///
  /// [session] Current user session.
  /// [id] Article ID to update.
  /// [buildingId] Building ID for access validation.
  /// [articleDto] Updated article data.
  ///
  /// Returns the updated article.
  Future<Article> updateArticle(
    Session session,
    UuidValue id,
    UuidValue buildingId,
    UpdateArticleDto articleDto,
  ) async {
    session.authorizedTo(['owner']);
    // Get existing article (already verifies buildingId match)
    final existingArticle = await getArticleById(session, id, buildingId);
    // Verify building ownership
    await EndpointHelpers.verifyBuildingAccess(
      session,
      buildingId,
      checkOwnership: true,
    );
    if (existingArticle.name != articleDto.name) {
      await EndpointHelpers.checkArticleNameExists(
        session,
        articleDto.name,
        buildingId,
      );
    }
    if (existingArticle.categorieId != articleDto.categoryId) {
      final categorie = await CategorieEndpoint().getCategorieById(
        session,
        articleDto.categoryId,
        buildingId,
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
