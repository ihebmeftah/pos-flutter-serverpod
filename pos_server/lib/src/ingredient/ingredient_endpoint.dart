import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';

class IngredientEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get Ingredients by building id
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of [Ingredient] ingredients
  Future<List<Ingredient>> getIngredientsByBuildingId(
    Session session,
    UuidValue buildingId,
  ) async {
    return await Ingredient.db.find(
      session,
      where: (i) => i.buildingId.equals(buildingId),
    );
  }

  /// Create new ingredient
  /// required [ingredient] The ingredient to create
  /// Returns the created [Ingredient] ingredient
  /// allow for owner users only
  Future<Ingredient> createIngredient(
    Session session,
    Ingredient ingredient,
  ) async {
    session.authorizedTo(['owner']);
    if (ingredient.currentStock < ingredient.thresholdStock) {
      throw AppException(
        errorType: ExceptionType.BadRequest,
        message:
            'Current stock cannot be less than threshold stock (${ingredient.thresholdStock})',
      );
    }
    await _existIngredientName(session, ingredient.name);
    return await Ingredient.db.insertRow(
      session,
      ingredient,
    );
  }

  Future<Ingredient> getIngredintById(Session session, UuidValue id) async {
    final ingredient = await Ingredient.db.findById(session, id);
    if (ingredient == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'This Ingredient not found',
      );
    }
    return ingredient;
  }

  @doNotGenerate
  Future<void> _existIngredientName(Session session, String name) async {
    final existe = await Ingredient.db.findFirstRow(
      session,
      where: (i) => i.name.equals(name),
    );
    if (existe != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Ingredient $name already exists',
      );
    }
  }

  /// Decrement stock in order
  /// required [id] The id of the ingredient
  /// required [qteUsed] The quantity used to decrement
  /// Returns the updated [Ingredient] ingredient
  Future<Ingredient> decrementStockInOrder(
    Session session,
    UuidValue id,
    double qteUsed,
  ) async {
    final ingredient = await getIngredintById(session, id);
    ingredient.currentStock -= qteUsed;
    if (ingredient.currentStock < 0) {
      ingredient.currentStock = 0;
    }
    return await Ingredient.db.updateRow(
      session,
      ingredient,
      columns: (cls) => [cls.currentStock],
    );
  }
}
