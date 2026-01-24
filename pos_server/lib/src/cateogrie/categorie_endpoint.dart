import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';
import '../helpers/endpoint_helpers.dart';

class CategorieEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Fetches all categories belonging to a specific building.
  ///
  /// [session] Current user session.
  /// [buildingId] ID of the building to fetch categories from.
  ///
  /// Returns a list of all categories for the building.
  Future<List<Categorie>> getCategories(
    Session session,
    UuidValue buildingId,
  ) async {
    return await Categorie.db.find(
      session,
      where: (c) => c.buildingId.equals(buildingId),
    );
  }

  /// Retrieves a specific category by ID.
  /// Validates that category belongs to the specified building.
  ///
  /// [session] Current user session.
  /// [id] Category ID to fetch.
  /// [buildingId] Building ID for access validation.
  ///
  /// Returns the category if found and belongs to building.
  Future<Categorie> getCategorieById(
    Session session,
    UuidValue id,
    UuidValue buildingId,
  ) async {
    final categorie = await Categorie.db.findFirstRow(
      session,
      where: (c) => c.id.equals(id) & c.buildingId.equals(buildingId),
    );
    if (categorie == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Categorie not found',
      );
    }
    return categorie;
  }

  /// Creates a new category for a building.
  /// Validates name uniqueness and building ownership. Owner only.
  ///
  /// [session] Current user session.
  /// [categorieDto] Category data including name and description.
  ///
  /// Returns the newly created category.
  Future<Categorie> createCategorie(
    Session session,
    CreateCategorieDto categorieDto,
  ) async {
    session.authorizedTo(['owner']);
    final building = await EndpointHelpers.verifyBuildingAccess(
      session,
      categorieDto.buildingId,
      checkOwnership: true,
    );
    await EndpointHelpers.checkCategorieNameExists(
      session,
      categorieDto.name,
      building.id,
    );
    final categorie = Categorie(
      name: categorieDto.name,
      description: categorieDto.description,
      buildingId: building.id,
    );
    return await Categorie.db.insertRow(
      session,
      categorie,
    );
  }

  /// Updates an existing category's information.
  /// Validates name uniqueness if changed. Owner only.
  ///
  /// [session] Current user session.
  /// [id] Category ID to update.
  /// [buildingId] Building ID for access validation.
  /// [categorieDto] Updated category data.
  ///
  /// Returns the updated category.
  Future<Categorie> updateCategorie(
    Session session,
    UuidValue id,
    UuidValue buildingId,
    UpdateCategorieDto categorieDto,
  ) async {
    session.authorizedTo(['owner']);
    // Get existing categorie (already verifies buildingId match)
    final existingCategorie = await getCategorieById(
      session,
      id,
      buildingId,
    );
    // Verify building ownership
    await EndpointHelpers.verifyBuildingAccess(
      session,
      buildingId,
      checkOwnership: true,
    );
    if (existingCategorie.name != categorieDto.name) {
      await EndpointHelpers.checkCategorieNameExists(
        session,
        categorieDto.name,
        buildingId,
      );
    }
    existingCategorie.name = categorieDto.name;
    existingCategorie.description = categorieDto.description;
    return await Categorie.db.updateRow(
      session,
      existingCategorie,
    );
  }
}
