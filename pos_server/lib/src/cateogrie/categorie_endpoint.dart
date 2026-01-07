import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class CategorieEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Categorie>> getCategories(Session session, int buildingId) async {
    List<Categorie> categories = await Categorie.db.find(
      session,
      where: (c) => c.buildingId.equals(buildingId),
    );
    return categories;
  }

  Future<Categorie> createCategorie(
    Session session, {
    required Categorie categorie,
    required int buildingId,
  }) async {
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
