/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Categorie
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Categorie._({
    this.id,
    required this.name,
    required this.description,
    required this.buildingId,
  });

  factory Categorie({
    int? id,
    required String name,
    required String description,
    required int? buildingId,
  }) = _CategorieImpl;

  factory Categorie.fromJson(Map<String, dynamic> jsonSerialization) {
    return Categorie(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      buildingId: jsonSerialization['buildingId'] as int?,
    );
  }

  static final t = CategorieTable();

  static const db = CategorieRepository._();

  @override
  int? id;

  String name;

  String description;

  int? buildingId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Categorie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Categorie copyWith({
    int? id,
    String? name,
    String? description,
    int? buildingId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Categorie',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      if (buildingId != null) 'buildingId': buildingId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Categorie',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
    };
  }

  static CategorieInclude include() {
    return CategorieInclude._();
  }

  static CategorieIncludeList includeList({
    _i1.WhereExpressionBuilder<CategorieTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategorieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategorieTable>? orderByList,
    CategorieInclude? include,
  }) {
    return CategorieIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Categorie.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Categorie.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategorieImpl extends Categorie {
  _CategorieImpl({
    int? id,
    required String name,
    required String description,
    required int? buildingId,
  }) : super._(
         id: id,
         name: name,
         description: description,
         buildingId: buildingId,
       );

  /// Returns a shallow copy of this [Categorie]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Categorie copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    Object? buildingId = _Undefined,
  }) {
    return Categorie(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      buildingId: buildingId is int? ? buildingId : this.buildingId,
    );
  }
}

class CategorieUpdateTable extends _i1.UpdateTable<CategorieTable> {
  CategorieUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> buildingId(int? value) => _i1.ColumnValue(
    table.buildingId,
    value,
  );
}

class CategorieTable extends _i1.Table<int?> {
  CategorieTable({super.tableRelation}) : super(tableName: 'categorie') {
    updateTable = CategorieUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    buildingId = _i1.ColumnInt(
      'buildingId',
      this,
    );
  }

  late final CategorieUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt buildingId;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    buildingId,
  ];
}

class CategorieInclude extends _i1.IncludeObject {
  CategorieInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Categorie.t;
}

class CategorieIncludeList extends _i1.IncludeList {
  CategorieIncludeList._({
    _i1.WhereExpressionBuilder<CategorieTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Categorie.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Categorie.t;
}

class CategorieRepository {
  const CategorieRepository._();

  /// Returns a list of [Categorie]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Categorie>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategorieTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategorieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategorieTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Categorie>(
      where: where?.call(Categorie.t),
      orderBy: orderBy?.call(Categorie.t),
      orderByList: orderByList?.call(Categorie.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Categorie] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Categorie?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategorieTable>? where,
    int? offset,
    _i1.OrderByBuilder<CategorieTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategorieTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Categorie>(
      where: where?.call(Categorie.t),
      orderBy: orderBy?.call(Categorie.t),
      orderByList: orderByList?.call(Categorie.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Categorie] by its [id] or null if no such row exists.
  Future<Categorie?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Categorie>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Categorie]s in the list and returns the inserted rows.
  ///
  /// The returned [Categorie]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Categorie>> insert(
    _i1.Session session,
    List<Categorie> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Categorie>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Categorie] and returns the inserted row.
  ///
  /// The returned [Categorie] will have its `id` field set.
  Future<Categorie> insertRow(
    _i1.Session session,
    Categorie row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Categorie>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Categorie]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Categorie>> update(
    _i1.Session session,
    List<Categorie> rows, {
    _i1.ColumnSelections<CategorieTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Categorie>(
      rows,
      columns: columns?.call(Categorie.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Categorie]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Categorie> updateRow(
    _i1.Session session,
    Categorie row, {
    _i1.ColumnSelections<CategorieTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Categorie>(
      row,
      columns: columns?.call(Categorie.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Categorie] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Categorie?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CategorieUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Categorie>(
      id,
      columnValues: columnValues(Categorie.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Categorie]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Categorie>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CategorieUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CategorieTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategorieTable>? orderBy,
    _i1.OrderByListBuilder<CategorieTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Categorie>(
      columnValues: columnValues(Categorie.t.updateTable),
      where: where(Categorie.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Categorie.t),
      orderByList: orderByList?.call(Categorie.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Categorie]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Categorie>> delete(
    _i1.Session session,
    List<Categorie> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Categorie>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Categorie].
  Future<Categorie> deleteRow(
    _i1.Session session,
    Categorie row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Categorie>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Categorie>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CategorieTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Categorie>(
      where: where(Categorie.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategorieTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Categorie>(
      where: where?.call(Categorie.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
