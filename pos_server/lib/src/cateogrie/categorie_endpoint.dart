import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../helpers/authorizations_helpers.dart';

class CategorieEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get all categories for a building
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of [Categorie] categories
  /// allow for all type of users (admin, employee, customer)
  Future<List<Categorie>> getCategories(Session session, int buildingId) async {
    List<Categorie> categories = await Categorie.db.find(
      session,
      where: (c) => c.buildingId.equals(buildingId),
    );
    return categories;
  }

  /// Get categorie by id
  /// required [id] The id of the categorie
  /// Returns the [Categorie] categorie
  /// allow for all type of users (admin, employee, customer)
  Future<Categorie> getCategorieById(Session session, int id) async {
    final categorie = await Categorie.db.findById(session, id);
    if (categorie == null) {
      throw AppException(
        errorType: ExceptionType.NotFound,
        message: 'Categorie not found',
      );
    }
    return categorie;
  }

  /// Create new categorie
  /// required [categorie] The categorie to create
  /// required [buildingId] buildingId The id of the building
  /// Returns the created [Categorie] categorie
  /// allow for admin users only
  Future<Categorie> createCategorie(
    Session session, {
    required Categorie categorie,
    required int buildingId,
  }) async {
    await AuthorizationsHelpers().requiredScopes(session, ["owner"]);
    await _checkCategorieNameExiste(session, categorie.name, buildingId);
    categorie.buildingId = buildingId;
    return await Categorie.db.insertRow(
      session,
      categorie,
    );
  }

  @doNotGenerate
  Future<void> _checkCategorieNameExiste(
    Session session,
    String name,
    int buildingId,
  ) async {
    final existe = await Categorie.db.findFirstRow(
      session,
      where: (c) => c.name.ilike(name) & c.buildingId.equals(buildingId),
    );
    if (existe != null) {
      throw AppException(
        errorType: ExceptionType.Conflict,
        message: 'Categorie with name $name already exists',
      );
    }
  }

  /// Update categorie
  /// required [categorie] The categorie to update
  /// Returns the updated [Categorie] categorie
  /// allow for admin users only
  Future<Categorie> updateCategorie(
    Session session, {
    required Categorie categorie,
  }) async {
    await AuthorizationsHelpers().requiredScopes(session, ["owner"]);
    final existingCategorie = await getCategorieById(session, categorie.id!);
    if (existingCategorie.name != categorie.name) {
      await _checkCategorieNameExiste(
        session,
        categorie.name,
        categorie.buildingId!,
      );
    }
    existingCategorie.name = categorie.name;
    existingCategorie.description = categorie.description;
    return await Categorie.db.updateRow(
      session,
      existingCategorie,
    );
  }
}
