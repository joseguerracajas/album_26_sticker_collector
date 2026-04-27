// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<AlbumVariantSticker> _$AlbumVariantStickerFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return AlbumVariantSticker(
    id: data['id'] as String,
    albumVariantId: data['album_variant_id'] as String,
    stickerId: data['sticker_id'] as String,
  );
}

Future<Map<String, dynamic>> _$AlbumVariantStickerToSupabase(
  AlbumVariantSticker instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'album_variant_id': instance.albumVariantId,
    'sticker_id': instance.stickerId,
  };
}

Future<AlbumVariantSticker> _$AlbumVariantStickerFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return AlbumVariantSticker(
    id: data['id'] as String,
    albumVariantId: data['album_variant_id'] as String,
    stickerId: data['sticker_id'] as String,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$AlbumVariantStickerToSqlite(
  AlbumVariantSticker instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'id': instance.id,
    'album_variant_id': instance.albumVariantId,
    'sticker_id': instance.stickerId,
  };
}

/// Construct a [AlbumVariantSticker]
class AlbumVariantStickerAdapter
    extends OfflineFirstWithSupabaseAdapter<AlbumVariantSticker> {
  AlbumVariantStickerAdapter();

  @override
  final supabaseTableName = 'album_variant_stickers';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'albumVariantId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'album_variant_id',
    ),
    'stickerId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'sticker_id',
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
    'albumVariantId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'album_variant_id',
      iterable: false,
      type: String,
    ),
    'stickerId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'sticker_id',
      iterable: false,
      type: String,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    AlbumVariantSticker instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `AlbumVariantSticker` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'AlbumVariantSticker';

  @override
  Future<AlbumVariantSticker> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantStickerFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    AlbumVariantSticker input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantStickerToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<AlbumVariantSticker> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantStickerFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    AlbumVariantSticker input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$AlbumVariantStickerToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
