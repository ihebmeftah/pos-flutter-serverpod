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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'access/access.dart' as _i5;
import 'article/article.dart' as _i6;
import 'buildings/building.dart' as _i7;
import 'buildings_tables/building_tables.dart' as _i8;
import 'buildings_tables/table_status_enum.dart' as _i9;
import 'cateogrie/categorie.dart' as _i10;
import 'employer/employer.dart' as _i11;
import 'exceptions/endpoint_exceptions.dart' as _i12;
import 'exceptions/exceptiont_enums.dart' as _i13;
import 'order/order.dart' as _i14;
import 'order/order_item.dart' as _i15;
import 'order/order_status_enum.dart' as _i16;
import 'package:pos_server/src/generated/access/access.dart' as _i17;
import 'package:pos_server/src/generated/article/article.dart' as _i18;
import 'package:pos_server/src/generated/buildings/building.dart' as _i19;
import 'package:pos_server/src/generated/buildings_tables/building_tables.dart'
    as _i20;
import 'package:pos_server/src/generated/cateogrie/categorie.dart' as _i21;
import 'package:pos_server/src/generated/employer/employer.dart' as _i22;
import 'package:pos_server/src/generated/order/order.dart' as _i23;
import 'package:pos_server/src/generated/order/order_item.dart' as _i24;
export 'access/access.dart';
export 'article/article.dart';
export 'buildings/building.dart';
export 'buildings_tables/building_tables.dart';
export 'buildings_tables/table_status_enum.dart';
export 'cateogrie/categorie.dart';
export 'employer/employer.dart';
export 'exceptions/endpoint_exceptions.dart';
export 'exceptions/exceptiont_enums.dart';
export 'order/order.dart';
export 'order/order_item.dart';
export 'order/order_status_enum.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'access',
      dartName: 'Access',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'access_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderCreation',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'orderCreationNotif',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'orderPayment',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'orderItemsPayment',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'appendItems',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'access_fk_0',
          columns: ['buildingId'],
          referenceTable: 'building',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'access_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'article',
      dartName: 'Article',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'article_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'categorieId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'article_fk_0',
          columns: ['categorieId'],
          referenceTable: 'categorie',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'article_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'b_tables',
      dartName: 'BTable',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'b_tables_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'number',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'seatsMax',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '4',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'b_tables_fk_0',
          columns: ['buildingId'],
          referenceTable: 'building',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'b_tables_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'building',
      dartName: 'Building',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'building_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'openingTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'closingTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'tableMultiOrder',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'allowAppendingItemsToOrder',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'building_fk_0',
          columns: ['authUserId'],
          referenceTable: 'serverpod_auth_core_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'building_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'categorie',
      dartName: 'Categorie',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'categorie_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'categorie_fk_0',
          columns: ['buildingId'],
          referenceTable: 'building',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'categorie_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'employers',
      dartName: 'Employer',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'employers_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'accessId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'employers_fk_0',
          columns: ['userProfileId'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'employers_fk_1',
          columns: ['buildingId'],
          referenceTable: 'building',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'employers_fk_2',
          columns: ['accessId'],
          referenceTable: 'access',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'employers_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'employer_profile_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userProfileId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order_items',
      dartName: 'OrderItem',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_items_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'article',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Article',
        ),
        _i2.ColumnDefinition(
          name: 'passedById',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'payed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_0',
          columns: ['passedById'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_1',
          columns: ['orderId'],
          referenceTable: 'orders',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_items_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'orders',
      dartName: 'Order',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'orders_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OrderStatus',
          columnDefault: '\'progress\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'btableId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'passedById',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'closedbyId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_0',
          columns: ['btableId'],
          referenceTable: 'b_tables',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_1',
          columns: ['passedById'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_2',
          columns: ['closedbyId'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'orders_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.Access) {
      return _i5.Access.fromJson(data) as T;
    }
    if (t == _i6.Article) {
      return _i6.Article.fromJson(data) as T;
    }
    if (t == _i7.Building) {
      return _i7.Building.fromJson(data) as T;
    }
    if (t == _i8.BTable) {
      return _i8.BTable.fromJson(data) as T;
    }
    if (t == _i9.TableStatus) {
      return _i9.TableStatus.fromJson(data) as T;
    }
    if (t == _i10.Categorie) {
      return _i10.Categorie.fromJson(data) as T;
    }
    if (t == _i11.Employer) {
      return _i11.Employer.fromJson(data) as T;
    }
    if (t == _i12.AppException) {
      return _i12.AppException.fromJson(data) as T;
    }
    if (t == _i13.ExceptionType) {
      return _i13.ExceptionType.fromJson(data) as T;
    }
    if (t == _i14.Order) {
      return _i14.Order.fromJson(data) as T;
    }
    if (t == _i15.OrderItem) {
      return _i15.OrderItem.fromJson(data) as T;
    }
    if (t == _i16.OrderStatus) {
      return _i16.OrderStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Access?>()) {
      return (data != null ? _i5.Access.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Article?>()) {
      return (data != null ? _i6.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Building?>()) {
      return (data != null ? _i7.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.BTable?>()) {
      return (data != null ? _i8.BTable.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TableStatus?>()) {
      return (data != null ? _i9.TableStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Categorie?>()) {
      return (data != null ? _i10.Categorie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Employer?>()) {
      return (data != null ? _i11.Employer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.AppException?>()) {
      return (data != null ? _i12.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ExceptionType?>()) {
      return (data != null ? _i13.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Order?>()) {
      return (data != null ? _i14.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.OrderItem?>()) {
      return (data != null ? _i15.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.OrderStatus?>()) {
      return (data != null ? _i16.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i15.OrderItem>) {
      return (data as List).map((e) => deserialize<_i15.OrderItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.OrderItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i15.OrderItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i17.Access>) {
      return (data as List).map((e) => deserialize<_i17.Access>(e)).toList()
          as T;
    }
    if (t == List<_i18.Article>) {
      return (data as List).map((e) => deserialize<_i18.Article>(e)).toList()
          as T;
    }
    if (t == List<_i19.Building>) {
      return (data as List).map((e) => deserialize<_i19.Building>(e)).toList()
          as T;
    }
    if (t == List<_i20.BTable>) {
      return (data as List).map((e) => deserialize<_i20.BTable>(e)).toList()
          as T;
    }
    if (t == List<_i21.Categorie>) {
      return (data as List).map((e) => deserialize<_i21.Categorie>(e)).toList()
          as T;
    }
    if (t == List<_i22.Employer>) {
      return (data as List).map((e) => deserialize<_i22.Employer>(e)).toList()
          as T;
    }
    if (t == List<_i23.Order>) {
      return (data as List).map((e) => deserialize<_i23.Order>(e)).toList()
          as T;
    }
    if (t == List<_i24.OrderItem>) {
      return (data as List).map((e) => deserialize<_i24.OrderItem>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Access => 'Access',
      _i6.Article => 'Article',
      _i7.Building => 'Building',
      _i8.BTable => 'BTable',
      _i9.TableStatus => 'TableStatus',
      _i10.Categorie => 'Categorie',
      _i11.Employer => 'Employer',
      _i12.AppException => 'AppException',
      _i13.ExceptionType => 'ExceptionType',
      _i14.Order => 'Order',
      _i15.OrderItem => 'OrderItem',
      _i16.OrderStatus => 'OrderStatus',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('pos.', '');
    }

    switch (data) {
      case _i5.Access():
        return 'Access';
      case _i6.Article():
        return 'Article';
      case _i7.Building():
        return 'Building';
      case _i8.BTable():
        return 'BTable';
      case _i9.TableStatus():
        return 'TableStatus';
      case _i10.Categorie():
        return 'Categorie';
      case _i11.Employer():
        return 'Employer';
      case _i12.AppException():
        return 'AppException';
      case _i13.ExceptionType():
        return 'ExceptionType';
      case _i14.Order():
        return 'Order';
      case _i15.OrderItem():
        return 'OrderItem';
      case _i16.OrderStatus():
        return 'OrderStatus';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Access') {
      return deserialize<_i5.Access>(data['data']);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i6.Article>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i7.Building>(data['data']);
    }
    if (dataClassName == 'BTable') {
      return deserialize<_i8.BTable>(data['data']);
    }
    if (dataClassName == 'TableStatus') {
      return deserialize<_i9.TableStatus>(data['data']);
    }
    if (dataClassName == 'Categorie') {
      return deserialize<_i10.Categorie>(data['data']);
    }
    if (dataClassName == 'Employer') {
      return deserialize<_i11.Employer>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i12.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i13.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i14.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i15.OrderItem>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i16.OrderStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Access:
        return _i5.Access.t;
      case _i6.Article:
        return _i6.Article.t;
      case _i7.Building:
        return _i7.Building.t;
      case _i8.BTable:
        return _i8.BTable.t;
      case _i10.Categorie:
        return _i10.Categorie.t;
      case _i11.Employer:
        return _i11.Employer.t;
      case _i14.Order:
        return _i14.Order.t;
      case _i15.OrderItem:
        return _i15.OrderItem.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'pos';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
