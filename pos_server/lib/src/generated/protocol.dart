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
import 'article/dto/create_article.dto.dart' as _i6;
import 'article/dto/update_article.dto.dart' as _i7;
import 'article/entity/article.dart' as _i8;
import 'article/entity/article_composition.dart' as _i9;
import 'buildings/building.dart' as _i10;
import 'buildings/currency_enum.dart' as _i11;
import 'buildings_tables/building_tables.dart' as _i12;
import 'buildings_tables/table_status_enum.dart' as _i13;
import 'cash_register/cash_register.dart' as _i14;
import 'cateogrie/dto/create_categorie.dto.dart' as _i15;
import 'cateogrie/dto/update_categorie.dto.dart' as _i16;
import 'cateogrie/entity/categorie.dart' as _i17;
import 'employer/create_employer.dto.dart' as _i18;
import 'employer/employer.dart' as _i19;
import 'exceptions/endpoint_exceptions.dart' as _i20;
import 'exceptions/exceptiont_enums.dart' as _i21;
import 'ingredient/ingredient.dart' as _i22;
import 'ingredient/units_type.enum.dart' as _i23;
import 'order/dto/append_items.dto.dart' as _i24;
import 'order/dto/create_order.dto.dart' as _i25;
import 'order/entity/order.dart' as _i26;
import 'order/entity/order_item.dart' as _i27;
import 'order/order_item_status_enum.dart' as _i28;
import 'order/order_status_enum.dart' as _i29;
import 'order/pay_methode_enum.dart' as _i30;
import 'package:pos_server/src/generated/access/access.dart' as _i31;
import 'package:pos_server/src/generated/article/entity/article.dart' as _i32;
import 'package:pos_server/src/generated/employer/employer.dart' as _i33;
import 'package:pos_server/src/generated/buildings/building.dart' as _i34;
import 'package:pos_server/src/generated/buildings_tables/building_tables.dart'
    as _i35;
import 'package:pos_server/src/generated/cash_register/cash_register.dart'
    as _i36;
import 'package:pos_server/src/generated/cateogrie/entity/categorie.dart'
    as _i37;
import 'package:pos_server/src/generated/ingredient/ingredient.dart' as _i38;
import 'package:pos_server/src/generated/order/entity/order.dart' as _i39;
import 'package:pos_server/src/generated/order/entity/order_item.dart' as _i40;
export 'access/access.dart';
export 'article/dto/create_article.dto.dart';
export 'article/dto/update_article.dto.dart';
export 'article/entity/article.dart';
export 'article/entity/article_composition.dart';
export 'buildings/building.dart';
export 'buildings/currency_enum.dart';
export 'buildings_tables/building_tables.dart';
export 'buildings_tables/table_status_enum.dart';
export 'cash_register/cash_register.dart';
export 'cateogrie/dto/create_categorie.dto.dart';
export 'cateogrie/dto/update_categorie.dto.dart';
export 'cateogrie/entity/categorie.dart';
export 'employer/create_employer.dto.dart';
export 'employer/employer.dart';
export 'exceptions/endpoint_exceptions.dart';
export 'exceptions/exceptiont_enums.dart';
export 'ingredient/ingredient.dart';
export 'ingredient/units_type.enum.dart';
export 'order/dto/append_items.dto.dart';
export 'order/dto/create_order.dto.dart';
export 'order/entity/order.dart';
export 'order/entity/order_item.dart';
export 'order/order_item_status_enum.dart';
export 'order/order_status_enum.dart';
export 'order/pay_methode_enum.dart';

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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'consultAllOrders',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
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
        ),
        _i2.ColumnDefinition(
          name: 'preparation',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'serveOrder',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'cashRegisterManagement',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
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
        _i2.IndexDefinition(
          indexName: 'access_buildingId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildingId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
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
          onDelete: _i2.ForeignKeyAction.setNull,
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
        _i2.IndexDefinition(
          indexName: 'article_categorieId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'categorieId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'article_compositions',
      dartName: 'ArticleComposition',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'articleId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'ingredientId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'quantity',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: '_articleCompositionArticleId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'article_compositions_fk_0',
          columns: ['articleId'],
          referenceTable: 'article',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'article_compositions_fk_1',
          columns: ['ingredientId'],
          referenceTable: 'ingredients',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'article_compositions_fk_2',
          columns: ['_articleCompositionArticleId'],
          referenceTable: 'article',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'article_compositions_pkey',
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
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
        _i2.IndexDefinition(
          indexName: 'btables_buildingId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildingId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
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
          name: 'orderWithCashRegister',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'cashRegisterLimitPerDay',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '3',
        ),
        _i2.ColumnDefinition(
          name: 'allowAppendingItemsToOrder',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'autoCloseOrdersAtClosingTime',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'strictMode',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'currencyCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Currency',
        ),
        _i2.ColumnDefinition(
          name: 'long',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
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
      name: 'cash_register',
      dartName: 'CashRegister',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'start',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'startAmount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'end',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'endAmount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
          columnDefault: '0.0',
        ),
        _i2.ColumnDefinition(
          name: 'isClosed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'cash_register_fk_0',
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
          indexName: 'cash_register_pkey',
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
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
          name: 'buildingId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
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
        _i2.IndexDefinition(
          indexName: 'categorie_buildingId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildingId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'phoneVerified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'persoEmail',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'persoEmailVerified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'userProfileId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'accessId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
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
          onDelete: _i2.ForeignKeyAction.cascade,
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
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'persoEmail',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'employer_buildingId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildingId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ingredients',
      dartName: 'Ingredient',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'unit',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UnitsType',
        ),
        _i2.ColumnDefinition(
          name: 'currentStock',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'thresholdStock',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ingredients_fk_0',
          columns: ['buildingId'],
          referenceTable: 'building',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ingredients_pkey',
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
      name: 'order_items',
      dartName: 'OrderItem',
      schema: 'public',
      module: 'pos',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'article',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Article',
        ),
        _i2.ColumnDefinition(
          name: 'itemStatus',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OrderItemStatus',
          columnDefault: '\'progress\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'passedById',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'payedToId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'preparedById',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
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
          name: 'preaparedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'payedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'payMethode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PayMethode',
          columnDefault: '\'cash\'::text',
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
          columns: ['payedToId'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_2',
          columns: ['preparedById'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'order_items_fk_3',
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
        _i2.IndexDefinition(
          indexName: 'order_item_orderId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'gen_random_uuid()',
        ),
        _i2.ColumnDefinition(
          name: 'cashRegisterId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OrderStatus',
          columnDefault: '\'progress\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'btableId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
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
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_0',
          columns: ['cashRegisterId'],
          referenceTable: 'cash_register',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_1',
          columns: ['btableId'],
          referenceTable: 'b_tables',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_2',
          columns: ['passedById'],
          referenceTable: 'serverpod_auth_core_profile',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'orders_fk_3',
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
        _i2.IndexDefinition(
          indexName: 'order_btableId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'btableId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
    if (t == _i6.CreateArticleDto) {
      return _i6.CreateArticleDto.fromJson(data) as T;
    }
    if (t == _i7.UpdateArticleDto) {
      return _i7.UpdateArticleDto.fromJson(data) as T;
    }
    if (t == _i8.Article) {
      return _i8.Article.fromJson(data) as T;
    }
    if (t == _i9.ArticleComposition) {
      return _i9.ArticleComposition.fromJson(data) as T;
    }
    if (t == _i10.Building) {
      return _i10.Building.fromJson(data) as T;
    }
    if (t == _i11.Currency) {
      return _i11.Currency.fromJson(data) as T;
    }
    if (t == _i12.BTable) {
      return _i12.BTable.fromJson(data) as T;
    }
    if (t == _i13.TableStatus) {
      return _i13.TableStatus.fromJson(data) as T;
    }
    if (t == _i14.CashRegister) {
      return _i14.CashRegister.fromJson(data) as T;
    }
    if (t == _i15.UpdateCategorieDto) {
      return _i15.UpdateCategorieDto.fromJson(data) as T;
    }
    if (t == _i16.CreateCategorieDto) {
      return _i16.CreateCategorieDto.fromJson(data) as T;
    }
    if (t == _i17.Categorie) {
      return _i17.Categorie.fromJson(data) as T;
    }
    if (t == _i18.CreateEmployerDTO) {
      return _i18.CreateEmployerDTO.fromJson(data) as T;
    }
    if (t == _i19.Employer) {
      return _i19.Employer.fromJson(data) as T;
    }
    if (t == _i20.AppException) {
      return _i20.AppException.fromJson(data) as T;
    }
    if (t == _i21.ExceptionType) {
      return _i21.ExceptionType.fromJson(data) as T;
    }
    if (t == _i22.Ingredient) {
      return _i22.Ingredient.fromJson(data) as T;
    }
    if (t == _i23.UnitsType) {
      return _i23.UnitsType.fromJson(data) as T;
    }
    if (t == _i24.AppendItemsDto) {
      return _i24.AppendItemsDto.fromJson(data) as T;
    }
    if (t == _i25.CreateOrderDto) {
      return _i25.CreateOrderDto.fromJson(data) as T;
    }
    if (t == _i26.Order) {
      return _i26.Order.fromJson(data) as T;
    }
    if (t == _i27.OrderItem) {
      return _i27.OrderItem.fromJson(data) as T;
    }
    if (t == _i28.OrderItemStatus) {
      return _i28.OrderItemStatus.fromJson(data) as T;
    }
    if (t == _i29.OrderStatus) {
      return _i29.OrderStatus.fromJson(data) as T;
    }
    if (t == _i30.PayMethode) {
      return _i30.PayMethode.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Access?>()) {
      return (data != null ? _i5.Access.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CreateArticleDto?>()) {
      return (data != null ? _i6.CreateArticleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.UpdateArticleDto?>()) {
      return (data != null ? _i7.UpdateArticleDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Article?>()) {
      return (data != null ? _i8.Article.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ArticleComposition?>()) {
      return (data != null ? _i9.ArticleComposition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Building?>()) {
      return (data != null ? _i10.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Currency?>()) {
      return (data != null ? _i11.Currency.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.BTable?>()) {
      return (data != null ? _i12.BTable.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TableStatus?>()) {
      return (data != null ? _i13.TableStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.CashRegister?>()) {
      return (data != null ? _i14.CashRegister.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UpdateCategorieDto?>()) {
      return (data != null ? _i15.UpdateCategorieDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.CreateCategorieDto?>()) {
      return (data != null ? _i16.CreateCategorieDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.Categorie?>()) {
      return (data != null ? _i17.Categorie.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.CreateEmployerDTO?>()) {
      return (data != null ? _i18.CreateEmployerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Employer?>()) {
      return (data != null ? _i19.Employer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.AppException?>()) {
      return (data != null ? _i20.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.ExceptionType?>()) {
      return (data != null ? _i21.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Ingredient?>()) {
      return (data != null ? _i22.Ingredient.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.UnitsType?>()) {
      return (data != null ? _i23.UnitsType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.AppendItemsDto?>()) {
      return (data != null ? _i24.AppendItemsDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.CreateOrderDto?>()) {
      return (data != null ? _i25.CreateOrderDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Order?>()) {
      return (data != null ? _i26.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.OrderItem?>()) {
      return (data != null ? _i27.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.OrderItemStatus?>()) {
      return (data != null ? _i28.OrderItemStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.OrderStatus?>()) {
      return (data != null ? _i29.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.PayMethode?>()) {
      return (data != null ? _i30.PayMethode.fromJson(data) : null) as T;
    }
    if (t == List<_i9.ArticleComposition>) {
      return (data as List)
              .map((e) => deserialize<_i9.ArticleComposition>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.ArticleComposition>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.ArticleComposition>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i27.OrderItem>) {
      return (data as List).map((e) => deserialize<_i27.OrderItem>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i27.OrderItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i27.OrderItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i31.Access>) {
      return (data as List).map((e) => deserialize<_i31.Access>(e)).toList()
          as T;
    }
    if (t == List<_i32.Article>) {
      return (data as List).map((e) => deserialize<_i32.Article>(e)).toList()
          as T;
    }
    if (t ==
        _i1
            .getType<
              ({_i4.AuthSuccess authSuccess, _i33.Employer? employer})
            >()) {
      return (
            authSuccess: deserialize<_i4.AuthSuccess>(
              ((data as Map)['n'] as Map)['authSuccess'],
            ),
            employer: ((data)['n'] as Map)['employer'] == null
                ? null
                : deserialize<_i33.Employer>(data['n']['employer']),
          )
          as T;
    }
    if (t == List<_i34.Building>) {
      return (data as List).map((e) => deserialize<_i34.Building>(e)).toList()
          as T;
    }
    if (t == List<_i35.BTable>) {
      return (data as List).map((e) => deserialize<_i35.BTable>(e)).toList()
          as T;
    }
    if (t == List<_i36.CashRegister>) {
      return (data as List)
              .map((e) => deserialize<_i36.CashRegister>(e))
              .toList()
          as T;
    }
    if (t == List<_i37.Categorie>) {
      return (data as List).map((e) => deserialize<_i37.Categorie>(e)).toList()
          as T;
    }
    if (t == List<_i33.Employer>) {
      return (data as List).map((e) => deserialize<_i33.Employer>(e)).toList()
          as T;
    }
    if (t == List<_i38.Ingredient>) {
      return (data as List).map((e) => deserialize<_i38.Ingredient>(e)).toList()
          as T;
    }
    if (t == List<_i39.Order>) {
      return (data as List).map((e) => deserialize<_i39.Order>(e)).toList()
          as T;
    }
    if (t == List<_i40.OrderItem>) {
      return (data as List).map((e) => deserialize<_i40.OrderItem>(e)).toList()
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
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
      _i6.CreateArticleDto => 'CreateArticleDto',
      _i7.UpdateArticleDto => 'UpdateArticleDto',
      _i8.Article => 'Article',
      _i9.ArticleComposition => 'ArticleComposition',
      _i10.Building => 'Building',
      _i11.Currency => 'Currency',
      _i12.BTable => 'BTable',
      _i13.TableStatus => 'TableStatus',
      _i14.CashRegister => 'CashRegister',
      _i15.UpdateCategorieDto => 'UpdateCategorieDto',
      _i16.CreateCategorieDto => 'CreateCategorieDto',
      _i17.Categorie => 'Categorie',
      _i18.CreateEmployerDTO => 'CreateEmployerDTO',
      _i19.Employer => 'Employer',
      _i20.AppException => 'AppException',
      _i21.ExceptionType => 'ExceptionType',
      _i22.Ingredient => 'Ingredient',
      _i23.UnitsType => 'UnitsType',
      _i24.AppendItemsDto => 'AppendItemsDto',
      _i25.CreateOrderDto => 'CreateOrderDto',
      _i26.Order => 'Order',
      _i27.OrderItem => 'OrderItem',
      _i28.OrderItemStatus => 'OrderItemStatus',
      _i29.OrderStatus => 'OrderStatus',
      _i30.PayMethode => 'PayMethode',
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
      case _i6.CreateArticleDto():
        return 'CreateArticleDto';
      case _i7.UpdateArticleDto():
        return 'UpdateArticleDto';
      case _i8.Article():
        return 'Article';
      case _i9.ArticleComposition():
        return 'ArticleComposition';
      case _i10.Building():
        return 'Building';
      case _i11.Currency():
        return 'Currency';
      case _i12.BTable():
        return 'BTable';
      case _i13.TableStatus():
        return 'TableStatus';
      case _i14.CashRegister():
        return 'CashRegister';
      case _i15.UpdateCategorieDto():
        return 'UpdateCategorieDto';
      case _i16.CreateCategorieDto():
        return 'CreateCategorieDto';
      case _i17.Categorie():
        return 'Categorie';
      case _i18.CreateEmployerDTO():
        return 'CreateEmployerDTO';
      case _i19.Employer():
        return 'Employer';
      case _i20.AppException():
        return 'AppException';
      case _i21.ExceptionType():
        return 'ExceptionType';
      case _i22.Ingredient():
        return 'Ingredient';
      case _i23.UnitsType():
        return 'UnitsType';
      case _i24.AppendItemsDto():
        return 'AppendItemsDto';
      case _i25.CreateOrderDto():
        return 'CreateOrderDto';
      case _i26.Order():
        return 'Order';
      case _i27.OrderItem():
        return 'OrderItem';
      case _i28.OrderItemStatus():
        return 'OrderItemStatus';
      case _i29.OrderStatus():
        return 'OrderStatus';
      case _i30.PayMethode():
        return 'PayMethode';
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
    if (dataClassName == 'CreateArticleDto') {
      return deserialize<_i6.CreateArticleDto>(data['data']);
    }
    if (dataClassName == 'UpdateArticleDto') {
      return deserialize<_i7.UpdateArticleDto>(data['data']);
    }
    if (dataClassName == 'Article') {
      return deserialize<_i8.Article>(data['data']);
    }
    if (dataClassName == 'ArticleComposition') {
      return deserialize<_i9.ArticleComposition>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i10.Building>(data['data']);
    }
    if (dataClassName == 'Currency') {
      return deserialize<_i11.Currency>(data['data']);
    }
    if (dataClassName == 'BTable') {
      return deserialize<_i12.BTable>(data['data']);
    }
    if (dataClassName == 'TableStatus') {
      return deserialize<_i13.TableStatus>(data['data']);
    }
    if (dataClassName == 'CashRegister') {
      return deserialize<_i14.CashRegister>(data['data']);
    }
    if (dataClassName == 'UpdateCategorieDto') {
      return deserialize<_i15.UpdateCategorieDto>(data['data']);
    }
    if (dataClassName == 'CreateCategorieDto') {
      return deserialize<_i16.CreateCategorieDto>(data['data']);
    }
    if (dataClassName == 'Categorie') {
      return deserialize<_i17.Categorie>(data['data']);
    }
    if (dataClassName == 'CreateEmployerDTO') {
      return deserialize<_i18.CreateEmployerDTO>(data['data']);
    }
    if (dataClassName == 'Employer') {
      return deserialize<_i19.Employer>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i20.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i21.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Ingredient') {
      return deserialize<_i22.Ingredient>(data['data']);
    }
    if (dataClassName == 'UnitsType') {
      return deserialize<_i23.UnitsType>(data['data']);
    }
    if (dataClassName == 'AppendItemsDto') {
      return deserialize<_i24.AppendItemsDto>(data['data']);
    }
    if (dataClassName == 'CreateOrderDto') {
      return deserialize<_i25.CreateOrderDto>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i26.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i27.OrderItem>(data['data']);
    }
    if (dataClassName == 'OrderItemStatus') {
      return deserialize<_i28.OrderItemStatus>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i29.OrderStatus>(data['data']);
    }
    if (dataClassName == 'PayMethode') {
      return deserialize<_i30.PayMethode>(data['data']);
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
      case _i8.Article:
        return _i8.Article.t;
      case _i9.ArticleComposition:
        return _i9.ArticleComposition.t;
      case _i10.Building:
        return _i10.Building.t;
      case _i12.BTable:
        return _i12.BTable.t;
      case _i14.CashRegister:
        return _i14.CashRegister.t;
      case _i17.Categorie:
        return _i17.Categorie.t;
      case _i19.Employer:
        return _i19.Employer.t;
      case _i22.Ingredient:
        return _i22.Ingredient.t;
      case _i26.Order:
        return _i26.Order.t;
      case _i27.OrderItem:
        return _i27.OrderItem.t;
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
    if (record is ({_i4.AuthSuccess authSuccess, _i33.Employer? employer})) {
      return {
        "n": {
          "authSuccess": record.authSuccess,
          "employer": record.employer,
        },
      };
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }

  /// Maps container types (like [List], [Map], [Set]) containing
  /// [Record]s or non-String-keyed [Map]s to their JSON representation.
  ///
  /// It should not be called for [SerializableModel] types. These
  /// handle the "[Record] in container" mapping internally already.
  ///
  /// It is only supposed to be called from generated protocol code.
  ///
  /// Returns either a `List<dynamic>` (for List, Sets, and Maps with
  /// non-String keys) or a `Map<String, dynamic>` in case the input was
  /// a `Map<String, …>`.
  Object? mapContainerToJson(Object obj) {
    if (obj is! Iterable && obj is! Map) {
      throw ArgumentError.value(
        obj,
        'obj',
        'The object to serialize should be of type List, Map, or Set',
      );
    }

    dynamic mapIfNeeded(Object? obj) {
      return switch (obj) {
        Record record => mapRecordToJson(record),
        Iterable iterable => mapContainerToJson(iterable),
        Map map => mapContainerToJson(map),
        Object? value => value,
      };
    }

    switch (obj) {
      case Map<String, dynamic>():
        return {
          for (var entry in obj.entries) entry.key: mapIfNeeded(entry.value),
        };
      case Map():
        return [
          for (var entry in obj.entries)
            {
              'k': mapIfNeeded(entry.key),
              'v': mapIfNeeded(entry.value),
            },
        ];

      case Iterable():
        return [
          for (var e in obj) mapIfNeeded(e),
        ];
    }

    return obj;
  }
}
