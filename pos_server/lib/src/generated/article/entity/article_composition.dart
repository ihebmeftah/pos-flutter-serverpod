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
import '../../ingredient/ingredient.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class ArticleComposition
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ArticleComposition._({
    _i1.UuidValue? id,
    this.articleId,
    required this.ingredientId,
    this.ingredient,
    required this.quantity,
  }) : id = id ?? _i1.Uuid().v4obj(),
       _articleCompositionArticleId = null;

  factory ArticleComposition({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    required _i1.UuidValue ingredientId,
    _i2.Ingredient? ingredient,
    required double quantity,
  }) = _ArticleCompositionImpl;

  factory ArticleComposition.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArticleCompositionImplicit._(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      articleId: jsonSerialization['articleId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['articleId']),
      ingredientId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['ingredientId'],
      ),
      ingredient: jsonSerialization['ingredient'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Ingredient>(
              jsonSerialization['ingredient'],
            ),
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      $_articleCompositionArticleId:
          jsonSerialization['_articleCompositionArticleId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['_articleCompositionArticleId'],
            ),
    );
  }

  static final t = ArticleCompositionTable();

  static const db = ArticleCompositionRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue? articleId;

  _i1.UuidValue ingredientId;

  _i2.Ingredient? ingredient;

  double quantity;

  final _i1.UuidValue? _articleCompositionArticleId;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    _i1.UuidValue? ingredientId,
    _i2.Ingredient? ingredient,
    double? quantity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArticleComposition',
      'id': id.toJson(),
      if (articleId != null) 'articleId': articleId?.toJson(),
      'ingredientId': ingredientId.toJson(),
      if (ingredient != null) 'ingredient': ingredient?.toJson(),
      'quantity': quantity,
      if (_articleCompositionArticleId != null)
        '_articleCompositionArticleId': _articleCompositionArticleId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ArticleComposition',
      'id': id.toJson(),
      'ingredientId': ingredientId.toJson(),
      if (ingredient != null) 'ingredient': ingredient?.toJsonForProtocol(),
      'quantity': quantity,
    };
  }

  static ArticleCompositionInclude include({
    _i2.IngredientInclude? ingredient,
  }) {
    return ArticleCompositionInclude._(ingredient: ingredient);
  }

  static ArticleCompositionIncludeList includeList({
    _i1.WhereExpressionBuilder<ArticleCompositionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleCompositionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleCompositionTable>? orderByList,
    ArticleCompositionInclude? include,
  }) {
    return ArticleCompositionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArticleComposition.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArticleComposition.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleCompositionImpl extends ArticleComposition {
  _ArticleCompositionImpl({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    required _i1.UuidValue ingredientId,
    _i2.Ingredient? ingredient,
    required double quantity,
  }) : super._(
         id: id,
         articleId: articleId,
         ingredientId: ingredientId,
         ingredient: ingredient,
         quantity: quantity,
       );

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    Object? articleId = _Undefined,
    _i1.UuidValue? ingredientId,
    Object? ingredient = _Undefined,
    double? quantity,
  }) {
    return ArticleCompositionImplicit._(
      id: id ?? this.id,
      articleId: articleId is _i1.UuidValue? ? articleId : this.articleId,
      ingredientId: ingredientId ?? this.ingredientId,
      ingredient: ingredient is _i2.Ingredient?
          ? ingredient
          : this.ingredient?.copyWith(),
      quantity: quantity ?? this.quantity,
      $_articleCompositionArticleId: this._articleCompositionArticleId,
    );
  }
}

class ArticleCompositionImplicit extends _ArticleCompositionImpl {
  ArticleCompositionImplicit._({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    required _i1.UuidValue ingredientId,
    _i2.Ingredient? ingredient,
    required double quantity,
    _i1.UuidValue? $_articleCompositionArticleId,
  }) : _articleCompositionArticleId = $_articleCompositionArticleId,
       super(
         id: id,
         articleId: articleId,
         ingredientId: ingredientId,
         ingredient: ingredient,
         quantity: quantity,
       );

  factory ArticleCompositionImplicit(
    ArticleComposition articleComposition, {
    _i1.UuidValue? $_articleCompositionArticleId,
  }) {
    return ArticleCompositionImplicit._(
      id: articleComposition.id,
      articleId: articleComposition.articleId,
      ingredientId: articleComposition.ingredientId,
      ingredient: articleComposition.ingredient,
      quantity: articleComposition.quantity,
      $_articleCompositionArticleId: $_articleCompositionArticleId,
    );
  }

  @override
  final _i1.UuidValue? _articleCompositionArticleId;
}

class ArticleCompositionUpdateTable
    extends _i1.UpdateTable<ArticleCompositionTable> {
  ArticleCompositionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> articleId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.articleId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> ingredientId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.ingredientId,
    value,
  );

  _i1.ColumnValue<double, double> quantity(double value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> $_articleCompositionArticleId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.$_articleCompositionArticleId,
    value,
  );
}

class ArticleCompositionTable extends _i1.Table<_i1.UuidValue> {
  ArticleCompositionTable({super.tableRelation})
    : super(tableName: 'article_compositions') {
    updateTable = ArticleCompositionUpdateTable(this);
    articleId = _i1.ColumnUuid(
      'articleId',
      this,
    );
    ingredientId = _i1.ColumnUuid(
      'ingredientId',
      this,
    );
    quantity = _i1.ColumnDouble(
      'quantity',
      this,
    );
    $_articleCompositionArticleId = _i1.ColumnUuid(
      '_articleCompositionArticleId',
      this,
    );
  }

  late final ArticleCompositionUpdateTable updateTable;

  late final _i1.ColumnUuid articleId;

  late final _i1.ColumnUuid ingredientId;

  _i2.IngredientTable? _ingredient;

  late final _i1.ColumnDouble quantity;

  late final _i1.ColumnUuid $_articleCompositionArticleId;

  _i2.IngredientTable get ingredient {
    if (_ingredient != null) return _ingredient!;
    _ingredient = _i1.createRelationTable(
      relationFieldName: 'ingredient',
      field: ArticleComposition.t.ingredientId,
      foreignField: _i2.Ingredient.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.IngredientTable(tableRelation: foreignTableRelation),
    );
    return _ingredient!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    articleId,
    ingredientId,
    quantity,
    $_articleCompositionArticleId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    articleId,
    ingredientId,
    quantity,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'ingredient') {
      return ingredient;
    }
    return null;
  }
}

class ArticleCompositionInclude extends _i1.IncludeObject {
  ArticleCompositionInclude._({_i2.IngredientInclude? ingredient}) {
    _ingredient = ingredient;
  }

  _i2.IngredientInclude? _ingredient;

  @override
  Map<String, _i1.Include?> get includes => {'ingredient': _ingredient};

  @override
  _i1.Table<_i1.UuidValue> get table => ArticleComposition.t;
}

class ArticleCompositionIncludeList extends _i1.IncludeList {
  ArticleCompositionIncludeList._({
    _i1.WhereExpressionBuilder<ArticleCompositionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArticleComposition.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ArticleComposition.t;
}

class ArticleCompositionRepository {
  const ArticleCompositionRepository._();

  final attachRow = const ArticleCompositionAttachRowRepository._();

  /// Returns a list of [ArticleComposition]s matching the given query parameters.
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
  Future<List<ArticleComposition>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleCompositionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleCompositionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleCompositionTable>? orderByList,
    _i1.Transaction? transaction,
    ArticleCompositionInclude? include,
  }) async {
    return session.db.find<ArticleComposition>(
      where: where?.call(ArticleComposition.t),
      orderBy: orderBy?.call(ArticleComposition.t),
      orderByList: orderByList?.call(ArticleComposition.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArticleComposition] matching the given query parameters.
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
  Future<ArticleComposition?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleCompositionTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArticleCompositionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleCompositionTable>? orderByList,
    _i1.Transaction? transaction,
    ArticleCompositionInclude? include,
  }) async {
    return session.db.findFirstRow<ArticleComposition>(
      where: where?.call(ArticleComposition.t),
      orderBy: orderBy?.call(ArticleComposition.t),
      orderByList: orderByList?.call(ArticleComposition.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArticleComposition] by its [id] or null if no such row exists.
  Future<ArticleComposition?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ArticleCompositionInclude? include,
  }) async {
    return session.db.findById<ArticleComposition>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArticleComposition]s in the list and returns the inserted rows.
  ///
  /// The returned [ArticleComposition]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArticleComposition>> insert(
    _i1.Session session,
    List<ArticleComposition> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArticleComposition>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArticleComposition] and returns the inserted row.
  ///
  /// The returned [ArticleComposition] will have its `id` field set.
  Future<ArticleComposition> insertRow(
    _i1.Session session,
    ArticleComposition row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArticleComposition>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArticleComposition]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArticleComposition>> update(
    _i1.Session session,
    List<ArticleComposition> rows, {
    _i1.ColumnSelections<ArticleCompositionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArticleComposition>(
      rows,
      columns: columns?.call(ArticleComposition.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArticleComposition]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArticleComposition> updateRow(
    _i1.Session session,
    ArticleComposition row, {
    _i1.ColumnSelections<ArticleCompositionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArticleComposition>(
      row,
      columns: columns?.call(ArticleComposition.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArticleComposition] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ArticleComposition?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ArticleCompositionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ArticleComposition>(
      id,
      columnValues: columnValues(ArticleComposition.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ArticleComposition]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ArticleComposition>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ArticleCompositionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ArticleCompositionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleCompositionTable>? orderBy,
    _i1.OrderByListBuilder<ArticleCompositionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ArticleComposition>(
      columnValues: columnValues(ArticleComposition.t.updateTable),
      where: where(ArticleComposition.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArticleComposition.t),
      orderByList: orderByList?.call(ArticleComposition.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ArticleComposition]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArticleComposition>> delete(
    _i1.Session session,
    List<ArticleComposition> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArticleComposition>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArticleComposition].
  Future<ArticleComposition> deleteRow(
    _i1.Session session,
    ArticleComposition row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArticleComposition>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArticleComposition>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArticleCompositionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArticleComposition>(
      where: where(ArticleComposition.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleCompositionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArticleComposition>(
      where: where?.call(ArticleComposition.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArticleCompositionAttachRowRepository {
  const ArticleCompositionAttachRowRepository._();

  /// Creates a relation between the given [ArticleComposition] and [Ingredient]
  /// by setting the [ArticleComposition]'s foreign key `ingredientId` to refer to the [Ingredient].
  Future<void> ingredient(
    _i1.Session session,
    ArticleComposition articleComposition,
    _i2.Ingredient ingredient, {
    _i1.Transaction? transaction,
  }) async {
    if (articleComposition.id == null) {
      throw ArgumentError.notNull('articleComposition.id');
    }
    if (ingredient.id == null) {
      throw ArgumentError.notNull('ingredient.id');
    }

    var $articleComposition = articleComposition.copyWith(
      ingredientId: ingredient.id,
    );
    await session.db.updateRow<ArticleComposition>(
      $articleComposition,
      columns: [ArticleComposition.t.ingredientId],
      transaction: transaction,
    );
  }
}
