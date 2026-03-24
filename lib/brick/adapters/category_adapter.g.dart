// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Category> _$CategoryFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Category(
    id: data['id'] as String,
    name: data['name'] as String,
    orderIndex: data['order_index'] as int,
    backgroundUrl: data['background_url'] == null
        ? null
        : data['background_url'] as String?,
    iconUrl: data['icon_url'] == null ? null : data['icon_url'] as String?,
    emoji: data['emoji'] as String,
  );
}

Future<Map<String, dynamic>> _$CategoryToSupabase(
  Category instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'order_index': instance.orderIndex,
    'background_url': instance.backgroundUrl,
    'icon_url': instance.iconUrl,
    'emoji': instance.emoji,
  };
}

Future<Category> _$CategoryFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Category(
    id: data['id'] as String,
    name: data['name'] as String,
    orderIndex: data['order_index'] as int,
    backgroundUrl: data['background_url'] == null
        ? null
        : data['background_url'] as String?,
    iconUrl: data['icon_url'] == null ? null : data['icon_url'] as String?,
    emoji: data['emoji'] as String,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$CategoryToSqlite(
  Category instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'order_index': instance.orderIndex,
    'background_url': instance.backgroundUrl,
    'icon_url': instance.iconUrl,
    'emoji': instance.emoji,
  };
}

/// Construct a [Category]
class CategoryAdapter extends OfflineFirstWithSupabaseAdapter<Category> {
  CategoryAdapter();

  @override
  final supabaseTableName = 'categories';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'name': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'name',
    ),
    'orderIndex': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'order_index',
    ),
    'backgroundUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'background_url',
    ),
    'iconUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'icon_url',
    ),
    'emoji': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'emoji',
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
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
    ),
    'orderIndex': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'order_index',
      iterable: false,
      type: int,
    ),
    'backgroundUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'background_url',
      iterable: false,
      type: String,
    ),
    'iconUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'icon_url',
      iterable: false,
      type: String,
    ),
    'emoji': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'emoji',
      iterable: false,
      type: String,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    Category instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `Category` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Category';

  @override
  Future<Category> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    Category input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Category> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    Category input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
