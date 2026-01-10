/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i2;
import '../buildings/building.dart' as _i3;
import 'package:pos_server/src/generated/protocol.dart' as _i4;

abstract class Employer
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Employer._({
    this.id,
    required this.userProfileId,
    required this.userProfile,
    required this.buildingId,
    this.building,
  });

  factory Employer({
    int? id,
    required _i1.UuidValue userProfileId,
    required _i2.UserProfile? userProfile,
    required int buildingId,
    _i3.Building? building,
  }) = _EmployerImpl;

  factory Employer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Employer(
      id: jsonSerialization['id'] as int?,
      userProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['userProfileId'],
      ),
      userProfile: jsonSerialization['userProfile'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.UserProfile>(
              jsonSerialization['userProfile'],
            ),
      buildingId: jsonSerialization['buildingId'] as int,
      building: jsonSerialization['building'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Building>(
              jsonSerialization['building'],
            ),
    );
  }

  static final t = EmployerTable();

  static const db = EmployerRepository._();

  @override
  int? id;

  _i1.UuidValue userProfileId;

  _i2.UserProfile? userProfile;

  int buildingId;

  _i3.Building? building;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Employer copyWith({
    int? id,
    _i1.UuidValue? userProfileId,
    _i2.UserProfile? userProfile,
    int? buildingId,
    _i3.Building? building,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Employer',
      if (id != null) 'id': id,
      'userProfileId': userProfileId.toJson(),
      if (userProfile != null) 'userProfile': userProfile?.toJson(),
      'buildingId': buildingId,
      if (building != null) 'building': building?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Employer',
      if (id != null) 'id': id,
      'userProfileId': userProfileId.toJson(),
      if (userProfile != null) 'userProfile': userProfile?.toJsonForProtocol(),
      'buildingId': buildingId,
      if (building != null) 'building': building?.toJsonForProtocol(),
    };
  }

  static EmployerInclude include({
    _i2.UserProfileInclude? userProfile,
    _i3.BuildingInclude? building,
  }) {
    return EmployerInclude._(
      userProfile: userProfile,
      building: building,
    );
  }

  static EmployerIncludeList includeList({
    _i1.WhereExpressionBuilder<EmployerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmployerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmployerTable>? orderByList,
    EmployerInclude? include,
  }) {
    return EmployerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Employer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Employer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmployerImpl extends Employer {
  _EmployerImpl({
    int? id,
    required _i1.UuidValue userProfileId,
    required _i2.UserProfile? userProfile,
    required int buildingId,
    _i3.Building? building,
  }) : super._(
         id: id,
         userProfileId: userProfileId,
         userProfile: userProfile,
         buildingId: buildingId,
         building: building,
       );

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Employer copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userProfileId,
    Object? userProfile = _Undefined,
    int? buildingId,
    Object? building = _Undefined,
  }) {
    return Employer(
      id: id is int? ? id : this.id,
      userProfileId: userProfileId ?? this.userProfileId,
      userProfile: userProfile is _i2.UserProfile?
          ? userProfile
          : this.userProfile?.copyWith(),
      buildingId: buildingId ?? this.buildingId,
      building: building is _i3.Building?
          ? building
          : this.building?.copyWith(),
    );
  }
}

class EmployerUpdateTable extends _i1.UpdateTable<EmployerTable> {
  EmployerUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userProfileId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.userProfileId,
    value,
  );

  _i1.ColumnValue<int, int> buildingId(int value) => _i1.ColumnValue(
    table.buildingId,
    value,
  );
}

class EmployerTable extends _i1.Table<int?> {
  EmployerTable({super.tableRelation}) : super(tableName: 'employers') {
    updateTable = EmployerUpdateTable(this);
    userProfileId = _i1.ColumnUuid(
      'userProfileId',
      this,
    );
    buildingId = _i1.ColumnInt(
      'buildingId',
      this,
    );
  }

  late final EmployerUpdateTable updateTable;

  late final _i1.ColumnUuid userProfileId;

  _i2.UserProfileTable? _userProfile;

  late final _i1.ColumnInt buildingId;

  _i3.BuildingTable? _building;

  _i2.UserProfileTable get userProfile {
    if (_userProfile != null) return _userProfile!;
    _userProfile = _i1.createRelationTable(
      relationFieldName: 'userProfile',
      field: Employer.t.userProfileId,
      foreignField: _i2.UserProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserProfileTable(tableRelation: foreignTableRelation),
    );
    return _userProfile!;
  }

  _i3.BuildingTable get building {
    if (_building != null) return _building!;
    _building = _i1.createRelationTable(
      relationFieldName: 'building',
      field: Employer.t.buildingId,
      foreignField: _i3.Building.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BuildingTable(tableRelation: foreignTableRelation),
    );
    return _building!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userProfileId,
    buildingId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userProfile') {
      return userProfile;
    }
    if (relationField == 'building') {
      return building;
    }
    return null;
  }
}

class EmployerInclude extends _i1.IncludeObject {
  EmployerInclude._({
    _i2.UserProfileInclude? userProfile,
    _i3.BuildingInclude? building,
  }) {
    _userProfile = userProfile;
    _building = building;
  }

  _i2.UserProfileInclude? _userProfile;

  _i3.BuildingInclude? _building;

  @override
  Map<String, _i1.Include?> get includes => {
    'userProfile': _userProfile,
    'building': _building,
  };

  @override
  _i1.Table<int?> get table => Employer.t;
}

class EmployerIncludeList extends _i1.IncludeList {
  EmployerIncludeList._({
    _i1.WhereExpressionBuilder<EmployerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Employer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Employer.t;
}

class EmployerRepository {
  const EmployerRepository._();

  final attachRow = const EmployerAttachRowRepository._();

  /// Returns a list of [Employer]s matching the given query parameters.
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
  Future<List<Employer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmployerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmployerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmployerTable>? orderByList,
    _i1.Transaction? transaction,
    EmployerInclude? include,
  }) async {
    return session.db.find<Employer>(
      where: where?.call(Employer.t),
      orderBy: orderBy?.call(Employer.t),
      orderByList: orderByList?.call(Employer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Employer] matching the given query parameters.
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
  Future<Employer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmployerTable>? where,
    int? offset,
    _i1.OrderByBuilder<EmployerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmployerTable>? orderByList,
    _i1.Transaction? transaction,
    EmployerInclude? include,
  }) async {
    return session.db.findFirstRow<Employer>(
      where: where?.call(Employer.t),
      orderBy: orderBy?.call(Employer.t),
      orderByList: orderByList?.call(Employer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Employer] by its [id] or null if no such row exists.
  Future<Employer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    EmployerInclude? include,
  }) async {
    return session.db.findById<Employer>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Employer]s in the list and returns the inserted rows.
  ///
  /// The returned [Employer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Employer>> insert(
    _i1.Session session,
    List<Employer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Employer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Employer] and returns the inserted row.
  ///
  /// The returned [Employer] will have its `id` field set.
  Future<Employer> insertRow(
    _i1.Session session,
    Employer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Employer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Employer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Employer>> update(
    _i1.Session session,
    List<Employer> rows, {
    _i1.ColumnSelections<EmployerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Employer>(
      rows,
      columns: columns?.call(Employer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Employer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Employer> updateRow(
    _i1.Session session,
    Employer row, {
    _i1.ColumnSelections<EmployerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Employer>(
      row,
      columns: columns?.call(Employer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Employer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Employer?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EmployerUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Employer>(
      id,
      columnValues: columnValues(Employer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Employer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Employer>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EmployerUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EmployerTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmployerTable>? orderBy,
    _i1.OrderByListBuilder<EmployerTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Employer>(
      columnValues: columnValues(Employer.t.updateTable),
      where: where(Employer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Employer.t),
      orderByList: orderByList?.call(Employer.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Employer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Employer>> delete(
    _i1.Session session,
    List<Employer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Employer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Employer].
  Future<Employer> deleteRow(
    _i1.Session session,
    Employer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Employer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Employer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmployerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Employer>(
      where: where(Employer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmployerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Employer>(
      where: where?.call(Employer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class EmployerAttachRowRepository {
  const EmployerAttachRowRepository._();

  /// Creates a relation between the given [Employer] and [UserProfile]
  /// by setting the [Employer]'s foreign key `userProfileId` to refer to the [UserProfile].
  Future<void> userProfile(
    _i1.Session session,
    Employer employer,
    _i2.UserProfile userProfile, {
    _i1.Transaction? transaction,
  }) async {
    if (employer.id == null) {
      throw ArgumentError.notNull('employer.id');
    }
    if (userProfile.id == null) {
      throw ArgumentError.notNull('userProfile.id');
    }

    var $employer = employer.copyWith(userProfileId: userProfile.id);
    await session.db.updateRow<Employer>(
      $employer,
      columns: [Employer.t.userProfileId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Employer] and [Building]
  /// by setting the [Employer]'s foreign key `buildingId` to refer to the [Building].
  Future<void> building(
    _i1.Session session,
    Employer employer,
    _i3.Building building, {
    _i1.Transaction? transaction,
  }) async {
    if (employer.id == null) {
      throw ArgumentError.notNull('employer.id');
    }
    if (building.id == null) {
      throw ArgumentError.notNull('building.id');
    }

    var $employer = employer.copyWith(buildingId: building.id);
    await session.db.updateRow<Employer>(
      $employer,
      columns: [Employer.t.buildingId],
      transaction: transaction,
    );
  }
}
