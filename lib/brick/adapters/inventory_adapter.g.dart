// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Inventory> _$InventoryFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Inventory(
    userId: data['user_id'] as String,
    stickerId: data['sticker_id'] as String,
    variantId: data['variant_id'] as String,
    quantity: data['quantity'] as int,
    lastUpdated: data['last_updated'] == null
        ? null
        : data['last_updated'] == null
        ? null
        : DateTime.tryParse(data['last_updated'] as String),
  );
}

Future<Map<String, dynamic>> _$InventoryToSupabase(
  Inventory instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'user_id': instance.userId,
    'sticker_id': instance.stickerId,
    'variant_id': instance.variantId,
    'quantity': instance.quantity,
    'last_updated': instance.lastUpdated?.toIso8601String(),
  };
}

Future<Inventory> _$InventoryFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Inventory(
    userId: data['user_id'] as String,
    stickerId: data['sticker_id'] as String,
    variantId: data['variant_id'] as String,
    quantity: data['quantity'] as int,
    lastUpdated: data['last_updated'] == null
        ? null
        : data['last_updated'] == null
        ? null
        : DateTime.tryParse(data['last_updated'] as String),
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$InventoryToSqlite(
  Inventory instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'user_id': instance.userId,
    'sticker_id': instance.stickerId,
    'variant_id': instance.variantId,
    'quantity': instance.quantity,
    'last_updated': instance.lastUpdated?.toIso8601String(),
  };
}

/// Construct a [Inventory]
class InventoryAdapter extends OfflineFirstWithSupabaseAdapter<Inventory> {
  InventoryAdapter();

  @override
  final supabaseTableName = 'inventory';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
    ),
    'stickerId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'sticker_id',
    ),
    'variantId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'variant_id',
    ),
    'quantity': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'quantity',
    ),
    'lastUpdated': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'last_updated',
    ),
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    ),
    'stickerId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'sticker_id',
      iterable: false,
      type: String,
    ),
    'variantId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'variant_id',
      iterable: false,
      type: String,
    ),
    'quantity': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'quantity',
      iterable: false,
      type: int,
    ),
    'lastUpdated': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'last_updated',
      iterable: false,
      type: DateTime,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    Inventory instance,
    DatabaseExecutor executor,
  ) async => instance.primaryKey;
  @override
  final String tableName = 'Inventory';

  @override
  Future<Inventory> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$InventoryFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    Inventory input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$InventoryToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Inventory> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$InventoryFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    Inventory input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$InventoryToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
