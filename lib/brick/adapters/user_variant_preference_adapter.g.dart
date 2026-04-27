// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<UserVariantPreference> _$UserVariantPreferenceFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return UserVariantPreference(
    id: data['id'] as String?,
    userId: data['user_id'] as String,
    albumId: data['album_id'] as String,
    albumVariantId: data['album_variant_id'] as String,
    updatedAt: data['updated_at'] == null
        ? null
        : data['updated_at'] == null
        ? null
        : DateTime.tryParse(data['updated_at'] as String),
  );
}

Future<Map<String, dynamic>> _$UserVariantPreferenceToSupabase(
  UserVariantPreference instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'user_id': instance.userId,
    'album_id': instance.albumId,
    'album_variant_id': instance.albumVariantId,
    'updated_at': instance.updatedAt?.toIso8601String(),
  };
}

Future<UserVariantPreference> _$UserVariantPreferenceFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return UserVariantPreference(
    id: data['id'] as String,
    userId: data['user_id'] as String,
    albumId: data['album_id'] as String,
    albumVariantId: data['album_variant_id'] as String,
    updatedAt: data['updated_at'] == null
        ? null
        : data['updated_at'] == null
        ? null
        : DateTime.tryParse(data['updated_at'] as String),
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$UserVariantPreferenceToSqlite(
  UserVariantPreference instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'user_id': instance.userId,
    'album_id': instance.albumId,
    'album_variant_id': instance.albumVariantId,
    'updated_at': instance.updatedAt?.toIso8601String(),
  };
}

/// Construct a [UserVariantPreference]
class UserVariantPreferenceAdapter
    extends OfflineFirstWithSupabaseAdapter<UserVariantPreference> {
  UserVariantPreferenceAdapter();

  @override
  final supabaseTableName = 'user_variant_preferences';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
    ),
    'albumId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'album_id',
    ),
    'albumVariantId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'album_variant_id',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
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
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    ),
    'albumId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'album_id',
      iterable: false,
      type: String,
    ),
    'albumVariantId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'album_variant_id',
      iterable: false,
      type: String,
    ),
    'updatedAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'updated_at',
      iterable: false,
      type: DateTime,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    UserVariantPreference instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `UserVariantPreference` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'UserVariantPreference';

  @override
  Future<UserVariantPreference> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$UserVariantPreferenceFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    UserVariantPreference input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$UserVariantPreferenceToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<UserVariantPreference> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$UserVariantPreferenceFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    UserVariantPreference input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$UserVariantPreferenceToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
