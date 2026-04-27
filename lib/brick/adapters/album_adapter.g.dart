// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Album> _$AlbumFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Album(
    id: data['id'] as String,
    name: data['name'] as String,
    year: data['year'] as int,
    isActive: data['is_active'] as bool,
    coverUrl: data['cover_url'] == null ? null : data['cover_url'] as String?,
  );
}

Future<Map<String, dynamic>> _$AlbumToSupabase(
  Album instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'year': instance.year,
    'is_active': instance.isActive,
    'cover_url': instance.coverUrl,
  };
}

Future<Album> _$AlbumFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Album(
    id: data['id'] as String,
    name: data['name'] as String,
    year: data['year'] as int,
    isActive: data['is_active'] == 1,
    coverUrl: data['cover_url'] == null ? null : data['cover_url'] as String?,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$AlbumToSqlite(
  Album instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'year': instance.year,
    'is_active': instance.isActive ? 1 : 0,
    'cover_url': instance.coverUrl,
  };
}

/// Construct a [Album]
class AlbumAdapter extends OfflineFirstWithSupabaseAdapter<Album> {
  AlbumAdapter();

  @override
  final supabaseTableName = 'albums';
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
    'year': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'year',
    ),
    'isActive': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'is_active',
    ),
    'coverUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'cover_url',
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
    'year': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'year',
      iterable: false,
      type: int,
    ),
    'isActive': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'is_active',
      iterable: false,
      type: bool,
    ),
    'coverUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'cover_url',
      iterable: false,
      type: String,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    Album instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `Album` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Album';

  @override
  Future<Album> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    Album input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Album> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    Album input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async =>
      await _$AlbumToSqlite(input, provider: provider, repository: repository);
}
