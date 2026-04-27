// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_core/query.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/db.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/brick_sqlite.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_supabase/brick_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:uuid/uuid.dart';// GENERATED CODE DO NOT EDIT
// ignore: unused_import
import 'dart:convert';
import 'package:brick_sqlite/brick_sqlite.dart' show SqliteModel, SqliteAdapter, SqliteModelDictionary, RuntimeSqliteColumnDefinition, SqliteProvider;
import 'package:brick_supabase/brick_supabase.dart' show SupabaseProvider, SupabaseModel, SupabaseAdapter, SupabaseModelDictionary;
// ignore: unused_import, unused_shown_name
import 'package:brick_offline_first/brick_offline_first.dart' show RuntimeOfflineFirstDefinition;
// ignore: unused_import, unused_shown_name
import 'package:sqflite_common/sqlite_api.dart' show DatabaseExecutor;

import '../features/catalog/domain/album.model.dart';
import '../features/catalog/domain/album_variant.model.dart';
import '../features/catalog/domain/album_variant_sticker.model.dart';
import '../features/catalog/domain/category.model.dart';
import '../features/catalog/domain/sticker.model.dart';
import '../features/catalog/domain/sticker_variant.model.dart';
import '../features/inventory/domain/inventory.model.dart';
import '../features/inventory/domain/user_variant_preference.model.dart';

part 'adapters/album_adapter.g.dart';
part 'adapters/album_variant_adapter.g.dart';
part 'adapters/album_variant_sticker_adapter.g.dart';
part 'adapters/category_adapter.g.dart';
part 'adapters/sticker_adapter.g.dart';
part 'adapters/sticker_variant_adapter.g.dart';
part 'adapters/inventory_adapter.g.dart';
part 'adapters/user_variant_preference_adapter.g.dart';

/// Supabase mappings should only be used when initializing a [SupabaseProvider]
final Map<Type, SupabaseAdapter<SupabaseModel>> supabaseMappings = {
  Album: AlbumAdapter(),
  AlbumVariant: AlbumVariantAdapter(),
  AlbumVariantSticker: AlbumVariantStickerAdapter(),
  Category: CategoryAdapter(),
  Sticker: StickerAdapter(),
  StickerVariant: StickerVariantAdapter(),
  Inventory: InventoryAdapter(),
  UserVariantPreference: UserVariantPreferenceAdapter()
};
final supabaseModelDictionary = SupabaseModelDictionary(supabaseMappings);

/// Sqlite mappings should only be used when initializing a [SqliteProvider]
final Map<Type, SqliteAdapter<SqliteModel>> sqliteMappings = {
  Album: AlbumAdapter(),
  AlbumVariant: AlbumVariantAdapter(),
  AlbumVariantSticker: AlbumVariantStickerAdapter(),
  Category: CategoryAdapter(),
  Sticker: StickerAdapter(),
  StickerVariant: StickerVariantAdapter(),
  Inventory: InventoryAdapter(),
  UserVariantPreference: UserVariantPreferenceAdapter()
};
final sqliteModelDictionary = SqliteModelDictionary(sqliteMappings);
