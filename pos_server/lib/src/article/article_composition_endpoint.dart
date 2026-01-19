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
    final composition = <ArticleComposition>[];
    for (ArticleComposition compo in articleComposition) {
      final ingredient = await IngredientEndpoint().getIngredintById(
        session,
        compo.ingredientId,
      );
      composition.add(
        ArticleComposition(
          articleId: articleId,
          ingredientId: ingredient.id,
          ingredient: ingredient,
          quantity: compo.quantity,
        ),
      );
    }
    return await ArticleComposition.db.insert(
      session,
      composition,
      transaction: transaction,
    );
  }
}
