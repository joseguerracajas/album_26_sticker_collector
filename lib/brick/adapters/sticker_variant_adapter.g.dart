// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<StickerVariant> _$StickerVariantFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return StickerVariant(
    id: data['id'] as String,
    name: data['name'] as String,
    hexColor: data['hex_color'] as String,
    isSpecial: data['is_special'] == null ? null : data['is_special'] as bool?,
    iconUrl: data['icon_url'] == null ? null : data['icon_url'] as String?,
    orderIndex: data['order_index'] as int,
  );
}

Future<Map<String, dynamic>> _$StickerVariantToSupabase(
  StickerVariant instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'hex_color': instance.hexColor,
    'is_special': instance.isSpecial,
    'icon_url': instance.iconUrl,
    'order_index': instance.orderIndex,
  };
}

Future<StickerVariant> _$StickerVariantFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return StickerVariant(
    id: data['id'] as String,
    name: data['name'] as String,
    hexColor: data['hex_color'] as String,
    isSpecial: data['is_special'] == null ? null : data['is_special'] == 1,
    iconUrl: data['icon_url'] == null ? null : data['icon_url'] as String?,
    orderIndex: data['order_index'] as int,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$StickerVariantToSqlite(
  StickerVariant instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'hex_color': instance.hexColor,
    'is_special': instance.isSpecial == null
        ? null
        : (instance.isSpecial! ? 1 : 0),
    'icon_url': instance.iconUrl,
    'order_index': instance.orderIndex,
  };
}

/// Construct a [StickerVariant]
class StickerVariantAdapter
    extends OfflineFirstWithSupabaseAdapter<StickerVariant> {
  StickerVariantAdapter();

  @override
  final supabaseTableName = 'sticker_variants';
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
    'hexColor': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'hex_color',
    ),
    'isSpecial': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'is_special',
    ),
    'iconUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'icon_url',
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
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
    ),
    'hexColor': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'hex_color',
      iterable: false,
      type: String,
    ),
    'isSpecial': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'is_special',
      iterable: false,
      type: bool,
    ),
    'iconUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'icon_url',
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
    StickerVariant instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `StickerVariant` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'StickerVariant';

  @override
  Future<StickerVariant> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerVariantFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    StickerVariant input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerVariantToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<StickerVariant> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerVariantFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    StickerVariant input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$StickerVariantToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
