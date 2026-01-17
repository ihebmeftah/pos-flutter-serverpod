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
import '../access/access.dart' as _i4;
import 'package:pos_server/src/generated/protocol.dart' as _i5;

abstract class Employer
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Employer._({
    _i1.UuidValue? id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    bool? phoneVerified,
    required this.persoEmail,
    bool? persoEmailVerified,
    required this.userProfileId,
    required this.userProfile,
    required this.buildingId,
    this.building,
    this.accessId,
    this.access,
  }) : id = id ?? _i1.Uuid().v4obj(),
       phoneVerified = phoneVerified ?? false,
       persoEmailVerified = persoEmailVerified ?? false;

  factory Employer({
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
    required int phone,
    bool? phoneVerified,
    required String persoEmail,
    bool? persoEmailVerified,
    required _i1.UuidValue userProfileId,
    required _i2.UserProfile? userProfile,
    required _i1.UuidValue buildingId,
    _i3.Building? building,
    _i1.UuidValue? accessId,
    _i4.Access? access,
  }) = _EmployerImpl;

  factory Employer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Employer(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      phone: jsonSerialization['phone'] as int,
      phoneVerified: jsonSerialization['phoneVerified'] as bool?,
      persoEmail: jsonSerialization['persoEmail'] as String,
      persoEmailVerified: jsonSerialization['persoEmailVerified'] as bool?,
      userProfileId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['userProfileId'],
      ),
      userProfile: jsonSerialization['userProfile'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.UserProfile>(
              jsonSerialization['userProfile'],
            ),
      buildingId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['buildingId'],
      ),
      building: jsonSerialization['building'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Building>(
              jsonSerialization['building'],
            ),
      accessId: jsonSerialization['accessId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['accessId']),
      access: jsonSerialization['access'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.Access>(jsonSerialization['access']),
    );
  }

  static final t = EmployerTable();

  static const db = EmployerRepository._();

  @override
  _i1.UuidValue id;

  String firstName;

  String lastName;

  int phone;

  bool phoneVerified;

  String persoEmail;

  bool persoEmailVerified;

  _i1.UuidValue userProfileId;

  _i2.UserProfile? userProfile;

  _i1.UuidValue buildingId;

  _i3.Building? building;

  _i1.UuidValue? accessId;

  _i4.Access? access;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Employer copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
    int? phone,
    bool? phoneVerified,
    String? persoEmail,
    bool? persoEmailVerified,
    _i1.UuidValue? userProfileId,
    _i2.UserProfile? userProfile,
    _i1.UuidValue? buildingId,
    _i3.Building? building,
    _i1.UuidValue? accessId,
    _i4.Access? access,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Employer',
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'phoneVerified': phoneVerified,
      'persoEmail': persoEmail,
      'persoEmailVerified': persoEmailVerified,
      'userProfileId': userProfileId.toJson(),
      if (userProfile != null) 'userProfile': userProfile?.toJson(),
      'buildingId': buildingId.toJson(),
      if (building != null) 'building': building?.toJson(),
      if (accessId != null) 'accessId': accessId?.toJson(),
      if (access != null) 'access': access?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Employer',
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'phoneVerified': phoneVerified,
      'persoEmail': persoEmail,
      'persoEmailVerified': persoEmailVerified,
      'userProfileId': userProfileId.toJson(),
      if (userProfile != null) 'userProfile': userProfile?.toJsonForProtocol(),
      'buildingId': buildingId.toJson(),
      if (building != null) 'building': building?.toJsonForProtocol(),
      if (accessId != null) 'accessId': accessId?.toJson(),
      if (access != null) 'access': access?.toJsonForProtocol(),
    };
  }

  static EmployerInclude include({
    _i2.UserProfileInclude? userProfile,
    _i3.BuildingInclude? building,
    _i4.AccessInclude? access,
  }) {
    return EmployerInclude._(
      userProfile: userProfile,
      building: building,
      access: access,
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
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
    required int phone,
    bool? phoneVerified,
    required String persoEmail,
    bool? persoEmailVerified,
    required _i1.UuidValue userProfileId,
    required _i2.UserProfile? userProfile,
    required _i1.UuidValue buildingId,
    _i3.Building? building,
    _i1.UuidValue? accessId,
    _i4.Access? access,
  }) : super._(
         id: id,
         firstName: firstName,
         lastName: lastName,
         phone: phone,
         phoneVerified: phoneVerified,
         persoEmail: persoEmail,
         persoEmailVerified: persoEmailVerified,
         userProfileId: userProfileId,
         userProfile: userProfile,
         buildingId: buildingId,
         building: building,
         accessId: accessId,
         access: access,
       );

  /// Returns a shallow copy of this [Employer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Employer copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
    int? phone,
    bool? phoneVerified,
    String? persoEmail,
    bool? persoEmailVerified,
    _i1.UuidValue? userProfileId,
    Object? userProfile = _Undefined,
    _i1.UuidValue? buildingId,
    Object? building = _Undefined,
    Object? accessId = _Undefined,
    Object? access = _Undefined,
  }) {
    return Employer(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      persoEmail: persoEmail ?? this.persoEmail,
      persoEmailVerified: persoEmailVerified ?? this.persoEmailVerified,
      userProfileId: userProfileId ?? this.userProfileId,
      userProfile: userProfile is _i2.UserProfile?
          ? userProfile
          : this.userProfile?.copyWith(),
      buildingId: buildingId ?? this.buildingId,
      building: building is _i3.Building?
          ? building
          : this.building?.copyWith(),
      accessId: accessId is _i1.UuidValue? ? accessId : this.accessId,
      access: access is _i4.Access? ? access : this.access?.copyWith(),
    );
  }
}

class EmployerUpdateTable extends _i1.UpdateTable<EmployerTable> {
  EmployerUpdateTable(super.table);

  _i1.ColumnValue<String, String> firstName(String value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<int, int> phone(int value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<bool, bool> phoneVerified(bool value) => _i1.ColumnValue(
    table.phoneVerified,
    value,
  );

  _i1.ColumnValue<String, String> persoEmail(String value) => _i1.ColumnValue(
    table.persoEmail,
    value,
  );

  _i1.ColumnValue<bool, bool> persoEmailVerified(bool value) => _i1.ColumnValue(
    table.persoEmailVerified,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userProfileId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.userProfileId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> buildingId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.buildingId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> accessId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.accessId,
    value,
  );
}

class EmployerTable extends _i1.Table<_i1.UuidValue> {
  EmployerTable({super.tableRelation}) : super(tableName: 'employers') {
    updateTable = EmployerUpdateTable(this);
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    phone = _i1.ColumnInt(
      'phone',
      this,
    );
    phoneVerified = _i1.ColumnBool(
      'phoneVerified',
      this,
    );
    persoEmail = _i1.ColumnString(
      'persoEmail',
      this,
    );
    persoEmailVerified = _i1.ColumnBool(
      'persoEmailVerified',
      this,
    );
    userProfileId = _i1.ColumnUuid(
      'userProfileId',
      this,
    );
    buildingId = _i1.ColumnUuid(
      'buildingId',
      this,
    );
    accessId = _i1.ColumnUuid(
      'accessId',
      this,
    );
  }

  late final EmployerUpdateTable updateTable;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnInt phone;

  late final _i1.ColumnBool phoneVerified;

  late final _i1.ColumnString persoEmail;

  late final _i1.ColumnBool persoEmailVerified;

  late final _i1.ColumnUuid userProfileId;

  _i2.UserProfileTable? _userProfile;

  late final _i1.ColumnUuid buildingId;

  _i3.BuildingTable? _building;

  late final _i1.ColumnUuid accessId;

  _i4.AccessTable? _access;

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

  _i4.AccessTable get access {
    if (_access != null) return _access!;
    _access = _i1.createRelationTable(
      relationFieldName: 'access',
      field: Employer.t.accessId,
      foreignField: _i4.Access.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AccessTable(tableRelation: foreignTableRelation),
    );
    return _access!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    firstName,
    lastName,
    phone,
    phoneVerified,
    persoEmail,
    persoEmailVerified,
    userProfileId,
    buildingId,
    accessId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userProfile') {
      return userProfile;
    }
    if (relationField == 'building') {
      return building;
    }
    if (relationField == 'access') {
      return access;
    }
    return null;
  }
}

class EmployerInclude extends _i1.IncludeObject {
  EmployerInclude._({
    _i2.UserProfileInclude? userProfile,
    _i3.BuildingInclude? building,
    _i4.AccessInclude? access,
  }) {
    _userProfile = userProfile;
    _building = building;
    _access = access;
  }

  _i2.UserProfileInclude? _userProfile;

  _i3.BuildingInclude? _building;

  _i4.AccessInclude? _access;

  @override
  Map<String, _i1.Include?> get includes => {
    'userProfile': _userProfile,
    'building': _building,
    'access': _access,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => Employer.t;
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
  _i1.Table<_i1.UuidValue> get table => Employer.t;
}

class EmployerRepository {
  const EmployerRepository._();

  final attachRow = const EmployerAttachRowRepository._();

  final detachRow = const EmployerDetachRowRepository._();

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
    _i1.UuidValue id, {
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
    _i1.UuidValue id, {
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

  /// Creates a relation between the given [Employer] and [Access]
  /// by setting the [Employer]'s foreign key `accessId` to refer to the [Access].
  Future<void> access(
    _i1.Session session,
    Employer employer,
    _i4.Access access, {
    _i1.Transaction? transaction,
  }) async {
    if (employer.id == null) {
      throw ArgumentError.notNull('employer.id');
    }
    if (access.id == null) {
      throw ArgumentError.notNull('access.id');
    }

    var $employer = employer.copyWith(accessId: access.id);
    await session.db.updateRow<Employer>(
      $employer,
      columns: [Employer.t.accessId],
      transaction: transaction,
    );
  }
}

class EmployerDetachRowRepository {
  const EmployerDetachRowRepository._();

  /// Detaches the relation between this [Employer] and the [Access] set in `access`
  /// by setting the [Employer]'s foreign key `accessId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> access(
    _i1.Session session,
    Employer employer, {
    _i1.Transaction? transaction,
  }) async {
    if (employer.id == null) {
      throw ArgumentError.notNull('employer.id');
    }

    var $employer = employer.copyWith(accessId: null);
    await session.db.updateRow<Employer>(
      $employer,
      columns: [Employer.t.accessId],
      transaction: transaction,
    );
  }
}
