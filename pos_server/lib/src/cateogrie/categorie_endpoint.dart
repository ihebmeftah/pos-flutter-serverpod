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
    await AuthorizationsHelpers().requiredScopes(session, ["admin"]);
    final existe = await Categorie.db.findFirstRow(
      session,
      where: (c) =>
          c.name.equals(categorie.name) & c.buildingId.equals(buildingId),
    );
    if (existe != null) throw Exception('Categorie already exists');
    categorie.buildingId = buildingId;
    return await Categorie.db.insertRow(
      session,
      categorie,
    );
  }
}
