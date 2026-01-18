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
import '../cateogrie/categorie.dart' as _i2;
import '../article/article_composition.dart' as _i3;
import 'package:pos_server/src/generated/protocol.dart' as _i4;

abstract class Article
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Article._({
    _i1.UuidValue? id,
    required this.name,
    this.description,
    required this.price,
    required this.categorieId,
    this.categorie,
    this.composition,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Article({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categorieId,
    _i2.Categorie? categorie,
    List<_i3.ArticleComposition>? composition,
  }) = _ArticleImpl;

  factory Article.fromJson(Map<String, dynamic> jsonSerialization) {
    return Article(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      categorieId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['categorieId'],
      ),
      categorie: jsonSerialization['categorie'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Categorie>(
              jsonSerialization['categorie'],
            ),
      composition: jsonSerialization['composition'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.ArticleComposition>>(
              jsonSerialization['composition'],
            ),
    );
  }

  static final t = ArticleTable();

  static const db = ArticleRepository._();

  @override
  _i1.UuidValue id;

  String name;

  String? description;

  double price;

  _i1.UuidValue categorieId;

  _i2.Categorie? categorie;

  List<_i3.ArticleComposition>? composition;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Article copyWith({
    _i1.UuidValue? id,
    String? name,
    String? description,
    double? price,
    _i1.UuidValue? categorieId,
    _i2.Categorie? categorie,
    List<_i3.ArticleComposition>? composition,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Article',
      'id': id.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categorieId': categorieId.toJson(),
      if (categorie != null) 'categorie': categorie?.toJson(),
      if (composition != null)
        'composition': composition?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Article',
      'id': id.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'price': price,
      'categorieId': categorieId.toJson(),
      if (categorie != null) 'categorie': categorie?.toJsonForProtocol(),
      if (composition != null)
        'composition': composition?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static ArticleInclude include({
    _i2.CategorieInclude? categorie,
    _i3.ArticleCompositionIncludeList? composition,
  }) {
    return ArticleInclude._(
      categorie: categorie,
      composition: composition,
    );
  }

  static ArticleIncludeList includeList({
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    ArticleInclude? include,
  }) {
    return ArticleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Article.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Article.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArticleImpl extends Article {
  _ArticleImpl({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required double price,
    required _i1.UuidValue categorieId,
    _i2.Categorie? categorie,
    List<_i3.ArticleComposition>? composition,
  }) : super._(
         id: id,
         name: name,
         description: description,
         price: price,
         categorieId: categorieId,
         categorie: categorie,
         composition: composition,
       );

  /// Returns a shallow copy of this [Article]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Article copyWith({
    _i1.UuidValue? id,
    String? name,
    Object? description = _Undefined,
    double? price,
    _i1.UuidValue? categorieId,
    Object? categorie = _Undefined,
    Object? composition = _Undefined,
  }) {
    return Article(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      price: price ?? this.price,
      categorieId: categorieId ?? this.categorieId,
      categorie: categorie is _i2.Categorie?
          ? categorie
          : this.categorie?.copyWith(),
      composition: composition is List<_i3.ArticleComposition>?
          ? composition
          : this.composition?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class ArticleUpdateTable extends _i1.UpdateTable<ArticleTable> {
  ArticleUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> categorieId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.categorieId,
    value,
  );
}

class ArticleTable extends _i1.Table<_i1.UuidValue> {
  ArticleTable({super.tableRelation}) : super(tableName: 'article') {
    updateTable = ArticleUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    categorieId = _i1.ColumnUuid(
      'categorieId',
      this,
    );
  }

  late final ArticleUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnUuid categorieId;

  _i2.CategorieTable? _categorie;

  _i3.ArticleCompositionTable? ___composition;

  _i1.ManyRelation<_i3.ArticleCompositionTable>? _composition;

  _i2.CategorieTable get categorie {
    if (_categorie != null) return _categorie!;
    _categorie = _i1.createRelationTable(
      relationFieldName: 'categorie',
      field: Article.t.categorieId,
      foreignField: _i2.Categorie.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CategorieTable(tableRelation: foreignTableRelation),
    );
    return _categorie!;
  }

  _i3.ArticleCompositionTable get __composition {
    if (___composition != null) return ___composition!;
    ___composition = _i1.createRelationTable(
      relationFieldName: '__composition',
      field: Article.t.id,
      foreignField: _i3.ArticleComposition.t.$_articleCompositionArticleId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArticleCompositionTable(tableRelation: foreignTableRelation),
    );
    return ___composition!;
  }

  _i1.ManyRelation<_i3.ArticleCompositionTable> get composition {
    if (_composition != null) return _composition!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'composition',
      field: Article.t.id,
      foreignField: _i3.ArticleComposition.t.$_articleCompositionArticleId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArticleCompositionTable(tableRelation: foreignTableRelation),
    );
    _composition = _i1.ManyRelation<_i3.ArticleCompositionTable>(
      tableWithRelations: relationTable,
      table: _i3.ArticleCompositionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _composition!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    price,
    categorieId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'categorie') {
      return categorie;
    }
    if (relationField == 'composition') {
      return __composition;
    }
    return null;
  }
}

class ArticleInclude extends _i1.IncludeObject {
  ArticleInclude._({
    _i2.CategorieInclude? categorie,
    _i3.ArticleCompositionIncludeList? composition,
  }) {
    _categorie = categorie;
    _composition = composition;
  }

  _i2.CategorieInclude? _categorie;

  _i3.ArticleCompositionIncludeList? _composition;

  @override
  Map<String, _i1.Include?> get includes => {
    'categorie': _categorie,
    'composition': _composition,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => Article.t;
}

class ArticleIncludeList extends _i1.IncludeList {
  ArticleIncludeList._({
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Article.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Article.t;
}

class ArticleRepository {
  const ArticleRepository._();

  final attach = const ArticleAttachRepository._();

  final attachRow = const ArticleAttachRowRepository._();

  final detach = const ArticleDetachRepository._();

  final detachRow = const ArticleDetachRowRepository._();

  /// Returns a list of [Article]s matching the given query parameters.
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
  Future<List<Article>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.find<Article>(
      where: where?.call(Article.t),
      orderBy: orderBy?.call(Article.t),
      orderByList: orderByList?.call(Article.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Article] matching the given query parameters.
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
  Future<Article?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.findFirstRow<Article>(
      where: where?.call(Article.t),
      orderBy: orderBy?.call(Article.t),
      orderByList: orderByList?.call(Article.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Article] by its [id] or null if no such row exists.
  Future<Article?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ArticleInclude? include,
  }) async {
    return session.db.findById<Article>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Article]s in the list and returns the inserted rows.
  ///
  /// The returned [Article]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Article>> insert(
    _i1.Session session,
    List<Article> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Article>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Article] and returns the inserted row.
  ///
  /// The returned [Article] will have its `id` field set.
  Future<Article> insertRow(
    _i1.Session session,
    Article row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Article>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Article]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Article>> update(
    _i1.Session session,
    List<Article> rows, {
    _i1.ColumnSelections<ArticleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Article>(
      rows,
      columns: columns?.call(Article.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Article]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Article> updateRow(
    _i1.Session session,
    Article row, {
    _i1.ColumnSelections<ArticleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Article>(
      row,
      columns: columns?.call(Article.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Article] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Article?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ArticleUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Article>(
      id,
      columnValues: columnValues(Article.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Article]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Article>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ArticleUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ArticleTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArticleTable>? orderBy,
    _i1.OrderByListBuilder<ArticleTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Article>(
      columnValues: columnValues(Article.t.updateTable),
      where: where(Article.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Article.t),
      orderByList: orderByList?.call(Article.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Article]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Article>> delete(
    _i1.Session session,
    List<Article> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Article>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Article].
  Future<Article> deleteRow(
    _i1.Session session,
    Article row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Article>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Article>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArticleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Article>(
      where: where(Article.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArticleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Article>(
      where: where?.call(Article.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArticleAttachRepository {
  const ArticleAttachRepository._();

  /// Creates a relation between this [Article] and the given [ArticleComposition]s
  /// by setting each [ArticleComposition]'s foreign key `_articleCompositionArticleId` to refer to this [Article].
  Future<void> composition(
    _i1.Session session,
    Article article,
    List<_i3.ArticleComposition> articleComposition, {
    _i1.Transaction? transaction,
  }) async {
    if (articleComposition.any((e) => e.id == null)) {
      throw ArgumentError.notNull('articleComposition.id');
    }
    if (article.id == null) {
      throw ArgumentError.notNull('article.id');
    }

    var $articleComposition = articleComposition
        .map(
          (e) => _i3.ArticleCompositionImplicit(
            e,
            $_articleCompositionArticleId: article.id,
          ),
        )
        .toList();
    await session.db.update<_i3.ArticleComposition>(
      $articleComposition,
      columns: [_i3.ArticleComposition.t.$_articleCompositionArticleId],
      transaction: transaction,
    );
  }
}

class ArticleAttachRowRepository {
  const ArticleAttachRowRepository._();

  /// Creates a relation between the given [Article] and [Categorie]
  /// by setting the [Article]'s foreign key `categorieId` to refer to the [Categorie].
  Future<void> categorie(
    _i1.Session session,
    Article article,
    _i2.Categorie categorie, {
    _i1.Transaction? transaction,
  }) async {
    if (article.id == null) {
      throw ArgumentError.notNull('article.id');
    }
    if (categorie.id == null) {
      throw ArgumentError.notNull('categorie.id');
    }

    var $article = article.copyWith(categorieId: categorie.id);
    await session.db.updateRow<Article>(
      $article,
      columns: [Article.t.categorieId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Article] and the given [ArticleComposition]
  /// by setting the [ArticleComposition]'s foreign key `_articleCompositionArticleId` to refer to this [Article].
  Future<void> composition(
    _i1.Session session,
    Article article,
    _i3.ArticleComposition articleComposition, {
    _i1.Transaction? transaction,
  }) async {
    if (articleComposition.id == null) {
      throw ArgumentError.notNull('articleComposition.id');
    }
    if (article.id == null) {
      throw ArgumentError.notNull('article.id');
    }

    var $articleComposition = _i3.ArticleCompositionImplicit(
      articleComposition,
      $_articleCompositionArticleId: article.id,
    );
    await session.db.updateRow<_i3.ArticleComposition>(
      $articleComposition,
      columns: [_i3.ArticleComposition.t.$_articleCompositionArticleId],
      transaction: transaction,
    );
  }
}

class ArticleDetachRepository {
  const ArticleDetachRepository._();

  /// Detaches the relation between this [Article] and the given [ArticleComposition]
  /// by setting the [ArticleComposition]'s foreign key `_articleCompositionArticleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> composition(
    _i1.Session session,
    List<_i3.ArticleComposition> articleComposition, {
    _i1.Transaction? transaction,
  }) async {
    if (articleComposition.any((e) => e.id == null)) {
      throw ArgumentError.notNull('articleComposition.id');
    }

    var $articleComposition = articleComposition
        .map(
          (e) => _i3.ArticleCompositionImplicit(
            e,
            $_articleCompositionArticleId: null,
          ),
        )
        .toList();
    await session.db.update<_i3.ArticleComposition>(
      $articleComposition,
      columns: [_i3.ArticleComposition.t.$_articleCompositionArticleId],
      transaction: transaction,
    );
  }
}

class ArticleDetachRowRepository {
  const ArticleDetachRowRepository._();

  /// Detaches the relation between this [Article] and the given [ArticleComposition]
  /// by setting the [ArticleComposition]'s foreign key `_articleCompositionArticleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> composition(
    _i1.Session session,
    _i3.ArticleComposition articleComposition, {
    _i1.Transaction? transaction,
  }) async {
    if (articleComposition.id == null) {
      throw ArgumentError.notNull('articleComposition.id');
    }

    var $articleComposition = _i3.ArticleCompositionImplicit(
      articleComposition,
      $_articleCompositionArticleId: null,
    );
    await session.db.updateRow<_i3.ArticleComposition>(
      $articleComposition,
      columns: [_i3.ArticleComposition.t.$_articleCompositionArticleId],
      transaction: transaction,
    );
  }
}
