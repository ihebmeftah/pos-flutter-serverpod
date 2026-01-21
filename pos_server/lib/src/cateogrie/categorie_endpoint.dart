import 'package:pos_server/src/buildings/building_endpoint.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../helpers/session_extensions.dart';

class CategorieEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Get all categories for a building
  /// required [buildingId] buildingId The id of the building
  /// Returns a list of [Categorie] categories
  Future<List<Categorie>> getCategories(
    Session session,
    UuidValue buildingId,
  ) async {
    List<Categorie> categories = await Categorie.db.find(
      session,
      where: (c) => c.buildingId.equals(buildingId),
    );
    return categories;
  }

  /// Get categorie by id
  /// required [id] The id of the categorie
  /// required [buildingId] The id of the building
  /// (ensure that users can only access categories that belong to buildings they have access to.)
  /// Returns the [Categorie] categorie
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

  /// Create new categorie
  /// required [categorie] The categorie to create
  /// Returns the created [Categorie] categorie
  /// allow for owner users only
  Future<Categorie> createCategorie(
    Session session,
    CreateCategorieDto categorieDto,
  ) async {
    session.authorizedTo(['owner']);
    final building = await BuildingEndpoint().getBuildingById(
      session,
      categorieDto.buildingId,
    );
    await _checkCategorieNameExiste(
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

  @doNotGenerate
  Future<void> _checkCategorieNameExiste(
    Session session,
    String name,
    UuidValue buildingId,
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
  /// required [categorieDto] The categorie to update
  /// required [id] The id of the categorie
  /// required [buildingId] The id of the building
  /// Returns the updated [Categorie] categorie
  /// allow for owner users only
  Future<Categorie> updateCategorie(
    Session session,
    UuidValue id,
    UuidValue buildingId,
    UpdateCategorieDto categorieDto,
  ) async {
    session.authorizedTo(['owner']);
    final buildinge = await BuildingEndpoint().getBuildingById(
      session,
      buildingId,
    );
    final existingCategorie = await getCategorieById(
      session,
      id,
      buildinge.id,
    );
    if (existingCategorie.name != categorieDto.name) {
      await _checkCategorieNameExiste(
        session,
        categorieDto.name,
        buildinge.id,
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
