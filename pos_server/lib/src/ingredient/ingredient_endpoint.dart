import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';
import '../helpers/endpoint_helpers.dart';

class IngredientEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Fetches all ingredients for a specific building.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch ingredients from.
  ///
  /// Returns a list of all ingredients in the building.
  Future<List<Ingredient>> getIngredientsByBuildingId(
    Session session,
    UuidValue buildingId,
  ) async {
    return await Ingredient.db.find(
      session,
      where: (i) => i.buildingId.equals(buildingId),
    );
  }

  /// Creates a new ingredient for a building.
  /// Validates stock levels and name uniqueness. Owner only.
  ///
  /// [session] Current user session.
  /// [ingredient] Ingredient data including stock levels.
  ///
  /// Returns the newly created ingredient.
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
    await EndpointHelpers.checkIngredientNameExists(
      session,
      ingredient.name,
      ingredient.buildingId,
    );
    return await Ingredient.db.insertRow(
      session,
      ingredient,
    );
  }

  /// Retrieves a specific ingredient by ID.
  /// Validates that ingredient belongs to the specified building.
  ///
  /// [session] Current user session.
  /// [id] Ingredient ID to fetch.
  /// [buildingId] Building ID for access validation.
  ///
  /// Returns the ingredient if found and belongs to building.
  Future<Ingredient> getIngredintById(
    Session session,
    UuidValue id,
    UuidValue buildingId,
  ) async {
    final ingredient = await Ingredient.db.findFirstRow(
      session,
      where: (i) => i.id.equals(id) & i.buildingId.equals(buildingId),
    );
    if (ingredient == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'This Ingredient not found',
      );
    }
    return ingredient;
  }

  /// Decrements ingredient stock when used in an order.
  /// Sets stock to 0 if result would be negative. Internal use only.
  ///
  /// [session] Current user session.
  /// [id] Ingredient ID to update.
  /// [buildingId] Building ID for validation.
  /// [qteUsed] Quantity to decrement from current stock.
  /// [transaction] Optional database transaction.
  ///
  /// Returns the updated ingredient with new stock level.
  @doNotGenerate
  Future<Ingredient> decrementStockInOrder(
    Session session,
    UuidValue id,
    UuidValue buildingId,
    double qteUsed, {
    Transaction? transaction,
  }) async {
    final ingredient = await getIngredintById(session, id, buildingId);
    ingredient.currentStock -= qteUsed;
    if (ingredient.currentStock < 0) {
      ingredient.currentStock = 0;
    }
    return await Ingredient.db.updateRow(
      session,
      ingredient,
      transaction: transaction,
      columns: (cls) => [cls.currentStock],
    );
  }
}
