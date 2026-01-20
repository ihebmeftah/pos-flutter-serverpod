import 'package:pos_server/src/article/article_endpoint.dart';
import 'package:pos_server/src/ingredient/ingredient_endpoint.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';

@doNotGenerate
class ArticleCompositionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Create new article composition
  /// required [articleComposition] The article composition to create
  /// Returns the created [ArticleComposition] article composition
  /// allow for owner users only
  Future<List<ArticleComposition>> createArticleComposition(
    Session session,
    UuidValue articleId,
    List<ArticleComposition> articleComposition, {
    Transaction? transaction,
  }) async {
    session.authorizedTo(['owner']);
    for (ArticleComposition compo in articleComposition) {
      await IngredientEndpoint().getIngredintById(
        session,
        compo.ingredientId,
      );
    }
    return await ArticleComposition.db.insert(
      session,
      articleComposition,
      transaction: transaction,
    );
  }

  /// Get Article Composition by article id
  /// required [articleId] The id of the article
  /// Returns a list of [ArticleComposition] compositions of the article
  @doNotGenerate
  Future<List<ArticleComposition>> getArticleCompositionByArticleId(
    Session session,
    UuidValue articleId,
  ) async {
    await ArticleEndpoint().getArticleById(
      session,
      articleId,
    );
    return await ArticleComposition.db.find(
      session,
      where: (ac) => ac.articleId.equals(articleId),
    );
  }
}
