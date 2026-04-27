// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<AlbumVariant> _$AlbumVariantFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return AlbumVariant(
    id: data['id'] as String,
    albumId: data['album_id'] as String,
    name: data['name'] as String,
    isDefault: data['is_default'] as bool,
  );
}

Future<Map<String, dynamic>> _$AlbumVariantToSupabase(
  AlbumVariant instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'album_id': instance.albumId,
    'name': instance.name,
    'is_default': instance.isDefault,
  };
}

Future<AlbumVariant> _$AlbumVariantFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return AlbumVariant(
    id: data['id'] as String,
    albumId: data['album_id'] as String,
    name: data['name'] as String,
    isDefault: data['is_default'] == 1,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$AlbumVariantToSqlite(
  AlbumVariant instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'album_id': instance.albumId,
    'name': instance.name,
    'is_default': instance.isDefault ? 1 : 0,
  };
}

/// Construct a [AlbumVariant]
class AlbumVariantAdapter
    extends OfflineFirstWithSupabaseAdapter<AlbumVariant> {
  AlbumVariantAdapter();

  @override
  final supabaseTableName = 'album_variants';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'albumId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'album_id',
    ),
    'name': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'name',
    ),
    'isDefault': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'is_default',
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
    'albumId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'album_id',
      iterable: false,
      type: String,
    ),
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
    ),
    'isDefault': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'is_default',
      iterable: false,
      type: bool,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    AlbumVariant instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `AlbumVariant` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'AlbumVariant';

  @override
  Future<AlbumVariant> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    AlbumVariant input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<AlbumVariant> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    AlbumVariant input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
