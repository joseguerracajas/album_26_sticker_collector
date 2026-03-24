// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Sticker> _$StickerFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Sticker(
    id: data['id'] as String,
    categoryId: data['category_id'] as String,
    stickerCode: data['sticker_code'] as String,
    description: data['description'] == null
        ? null
        : data['description'] as String?,
    orderIndex: data['order_index'] as int,
  );
}

Future<Map<String, dynamic>> _$StickerToSupabase(
  Sticker instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'category_id': instance.categoryId,
    'sticker_code': instance.stickerCode,
    'description': instance.description,
    'order_index': instance.orderIndex,
  };
}

Future<Sticker> _$StickerFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Sticker(
    id: data['id'] as String,
    categoryId: data['category_id'] as String,
    stickerCode: data['sticker_code'] as String,
    description: data['description'] == null
        ? null
        : data['description'] as String?,
    orderIndex: data['order_index'] as int,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$StickerToSqlite(
  Sticker instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'category_id': instance.categoryId,
    'sticker_code': instance.stickerCode,
    'description': instance.description,
    'order_index': instance.orderIndex,
  };
}

/// Construct a [Sticker]
class StickerAdapter extends OfflineFirstWithSupabaseAdapter<Sticker> {
  StickerAdapter();

  @override
  final supabaseTableName = 'stickers';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'categoryId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'category_id',
    ),
    'stickerCode': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'sticker_code',
    ),
    'description': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'description',
    ),
    'orderIndex': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'order_index',
    ),
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'id'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'id': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'id',
      iterable: false,
      type: String,
    ),
    'categoryId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'category_id',
      iterable: false,
      type: String,
    ),
    'stickerCode': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'sticker_code',
      iterable: false,
      type: String,
    ),
    'description': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'description',
      iterable: false,
      type: String,
    ),
    'orderIndex': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'order_index',
      iterable: false,
      type: int,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    Sticker instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `Sticker` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Sticker';

  @override
  Future<Sticker> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    Sticker input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Sticker> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    Sticker input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
