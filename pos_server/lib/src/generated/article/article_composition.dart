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
import '../ingredient/ingredient.dart' as _i2;
import 'package:pos_server/src/generated/protocol.dart' as _i3;

abstract class ArticleComposition
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ArticleComposition._({
    _i1.UuidValue? id,
    required this.articleId,
    this.ingredients,
    required this.quantity,
  }) : id = id ?? _i1.Uuid().v4obj(),
       _articleCompositionArticleId = null;

  factory ArticleComposition({
    _i1.UuidValue? id,
    required _i1.UuidValue articleId,
    List<_i2.Ingredient>? ingredients,
    required double quantity,
  }) = _ArticleCompositionImpl;

  factory ArticleComposition.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArticleCompositionImplicit._(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      articleId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['articleId'],
      ),
      ingredients: jsonSerialization['ingredients'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.Ingredient>>(
              jsonSerialization['ingredients'],
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

  _i1.UuidValue articleId;

  List<_i2.Ingredient>? ingredients;

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
    List<_i2.Ingredient>? ingredients,
    double? quantity,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ArticleComposition',
      'id': id.toJson(),
      'articleId': articleId.toJson(),
      if (ingredients != null)
        'ingredients': ingredients?.toJson(valueToJson: (v) => v.toJson()),
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
      'articleId': articleId.toJson(),
      if (ingredients != null)
        'ingredients': ingredients?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'quantity': quantity,
    };
  }

  static ArticleCompositionInclude include({
    _i2.IngredientIncludeList? ingredients,
  }) {
    return ArticleCompositionInclude._(ingredients: ingredients);
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
    required _i1.UuidValue articleId,
    List<_i2.Ingredient>? ingredients,
    required double quantity,
  }) : super._(
         id: id,
         articleId: articleId,
         ingredients: ingredients,
         quantity: quantity,
       );

  /// Returns a shallow copy of this [ArticleComposition]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArticleComposition copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? articleId,
    Object? ingredients = _Undefined,
    double? quantity,
  }) {
    return ArticleCompositionImplicit._(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      ingredients: ingredients is List<_i2.Ingredient>?
          ? ingredients
          : this.ingredients?.map((e0) => e0.copyWith()).toList(),
      quantity: quantity ?? this.quantity,
      $_articleCompositionArticleId: this._articleCompositionArticleId,
    );
  }
}

class ArticleCompositionImplicit extends _ArticleCompositionImpl {
  ArticleCompositionImplicit._({
    _i1.UuidValue? id,
    required _i1.UuidValue articleId,
    List<_i2.Ingredient>? ingredients,
    required double quantity,
    _i1.UuidValue? $_articleCompositionArticleId,
  }) : _articleCompositionArticleId = $_articleCompositionArticleId,
       super(
         id: id,
         articleId: articleId,
         ingredients: ingredients,
         quantity: quantity,
       );

  factory ArticleCompositionImplicit(
    ArticleComposition articleComposition, {
    _i1.UuidValue? $_articleCompositionArticleId,
  }) {
    return ArticleCompositionImplicit._(
      id: articleComposition.id,
      articleId: articleComposition.articleId,
      ingredients: articleComposition.ingredients,
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
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.articleId,
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

  _i2.IngredientTable? ___ingredients;

  _i1.ManyRelation<_i2.IngredientTable>? _ingredients;

  late final _i1.ColumnDouble quantity;

  late final _i1.ColumnUuid $_articleCompositionArticleId;

  _i2.IngredientTable get __ingredients {
    if (___ingredients != null) return ___ingredients!;
    ___ingredients = _i1.createRelationTable(
      relationFieldName: '__ingredients',
      field: ArticleComposition.t.id,
      foreignField: _i2
          .Ingredient
          .t
          .$_articleCompositionsIngredientsArticleCompositionsId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.IngredientTable(tableRelation: foreignTableRelation),
    );
    return ___ingredients!;
  }

  _i1.ManyRelation<_i2.IngredientTable> get ingredients {
    if (_ingredients != null) return _ingredients!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'ingredients',
      field: ArticleComposition.t.id,
      foreignField: _i2
          .Ingredient
          .t
          .$_articleCompositionsIngredientsArticleCompositionsId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.IngredientTable(tableRelation: foreignTableRelation),
    );
    _ingredients = _i1.ManyRelation<_i2.IngredientTable>(
      tableWithRelations: relationTable,
      table: _i2.IngredientTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _ingredients!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    articleId,
    quantity,
    $_articleCompositionArticleId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    articleId,
    quantity,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'ingredients') {
      return __ingredients;
    }
    return null;
  }
}

class ArticleCompositionInclude extends _i1.IncludeObject {
  ArticleCompositionInclude._({_i2.IngredientIncludeList? ingredients}) {
    _ingredients = ingredients;
  }

  _i2.IngredientIncludeList? _ingredients;

  @override
  Map<String, _i1.Include?> get includes => {'ingredients': _ingredients};

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

  final attach = const ArticleCompositionAttachRepository._();

  final attachRow = const ArticleCompositionAttachRowRepository._();

  final detach = const ArticleCompositionDetachRepository._();

  final detachRow = const ArticleCompositionDetachRowRepository._();

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

class ArticleCompositionAttachRepository {
  const ArticleCompositionAttachRepository._();

  /// Creates a relation between this [ArticleComposition] and the given [Ingredient]s
  /// by setting each [Ingredient]'s foreign key `_articleCompositionsIngredientsArticleCompositionsId` to refer to this [ArticleComposition].
  Future<void> ingredients(
    _i1.Session session,
    ArticleComposition articleComposition,
    List<_i2.Ingredient> ingredient, {
    _i1.Transaction? transaction,
  }) async {
    if (ingredient.any((e) => e.id == null)) {
      throw ArgumentError.notNull('ingredient.id');
    }
    if (articleComposition.id == null) {
      throw ArgumentError.notNull('articleComposition.id');
    }

    var $ingredient = ingredient
        .map(
          (e) => _i2.IngredientImplicit(
            e,
            $_articleCompositionsIngredientsArticleCompositionsId:
                articleComposition.id,
          ),
        )
        .toList();
    await session.db.update<_i2.Ingredient>(
      $ingredient,
      columns: [
        _i2.Ingredient.t.$_articleCompositionsIngredientsArticleCompositionsId,
      ],
      transaction: transaction,
    );
  }
}

class ArticleCompositionAttachRowRepository {
  const ArticleCompositionAttachRowRepository._();

  /// Creates a relation between this [ArticleComposition] and the given [Ingredient]
  /// by setting the [Ingredient]'s foreign key `_articleCompositionsIngredientsArticleCompositionsId` to refer to this [ArticleComposition].
  Future<void> ingredients(
    _i1.Session session,
    ArticleComposition articleComposition,
    _i2.Ingredient ingredient, {
    _i1.Transaction? transaction,
  }) async {
    if (ingredient.id == null) {
      throw ArgumentError.notNull('ingredient.id');
    }
    if (articleComposition.id == null) {
      throw ArgumentError.notNull('articleComposition.id');
    }

    var $ingredient = _i2.IngredientImplicit(
      ingredient,
      $_articleCompositionsIngredientsArticleCompositionsId:
          articleComposition.id,
    );
    await session.db.updateRow<_i2.Ingredient>(
      $ingredient,
      columns: [
        _i2.Ingredient.t.$_articleCompositionsIngredientsArticleCompositionsId,
      ],
      transaction: transaction,
    );
  }
}

class ArticleCompositionDetachRepository {
  const ArticleCompositionDetachRepository._();

  /// Detaches the relation between this [ArticleComposition] and the given [Ingredient]
  /// by setting the [Ingredient]'s foreign key `_articleCompositionsIngredientsArticleCompositionsId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ingredients(
    _i1.Session session,
    List<_i2.Ingredient> ingredient, {
    _i1.Transaction? transaction,
  }) async {
    if (ingredient.any((e) => e.id == null)) {
      throw ArgumentError.notNull('ingredient.id');
    }

    var $ingredient = ingredient
        .map(
          (e) => _i2.IngredientImplicit(
            e,
            $_articleCompositionsIngredientsArticleCompositionsId: null,
          ),
        )
        .toList();
    await session.db.update<_i2.Ingredient>(
      $ingredient,
      columns: [
        _i2.Ingredient.t.$_articleCompositionsIngredientsArticleCompositionsId,
      ],
      transaction: transaction,
    );
  }
}

class ArticleCompositionDetachRowRepository {
  const ArticleCompositionDetachRowRepository._();

  /// Detaches the relation between this [ArticleComposition] and the given [Ingredient]
  /// by setting the [Ingredient]'s foreign key `_articleCompositionsIngredientsArticleCompositionsId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ingredients(
    _i1.Session session,
    _i2.Ingredient ingredient, {
    _i1.Transaction? transaction,
  }) async {
    if (ingredient.id == null) {
      throw ArgumentError.notNull('ingredient.id');
    }

    var $ingredient = _i2.IngredientImplicit(
      ingredient,
      $_articleCompositionsIngredientsArticleCompositionsId: null,
    );
    await session.db.updateRow<_i2.Ingredient>(
      $ingredient,
      columns: [
        _i2.Ingredient.t.$_articleCompositionsIngredientsArticleCompositionsId,
      ],
      transaction: transaction,
    );
  }
}
