// import brick.g.dart and brick/db/schema.g.dart

import 'package:album_26_sticker_collector/brick/brick.g.dart';
import 'package:album_26_sticker_collector/brick/db/schema.g.dart';
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:brick_supabase/brick_supabase.dart';

class AppRepository extends OfflineFirstWithSupabaseRepository {
  static late AppRepository? _singleton;

  AppRepository._({
    required super.supabaseProvider,
    required super.sqliteProvider,
    required super.migrations,
    required super.offlineRequestQueue,
    super.memoryCacheProvider,
  });

  factory AppRepository() => _singleton!;

  static void configure({
    required String supabaseUrl,
    required String supabaseAnonKey,
  }) {
    // Convenience method `.clientQueue` makes creating the queue and client easy.
    final (client, queue) = OfflineFirstWithSupabaseRepository.clientQueue(
      // For Flutter, use import 'package:sqflite/sqflite.dart' show databaseFactory;
      // For unit testing (even in Flutter), use import 'package:sqflite_common_ffi/sqflite_ffi.dart' show databaseFactory;
      databaseFactory: databaseFactory,
    );

    final provider = SupabaseProvider(
      SupabaseClient(supabaseUrl, supabaseAnonKey, httpClient: client),
      modelDictionary: supabaseModelDictionary,
    );

    // Finally, initialize the repository as normal.
    _singleton = AppRepository._(
      supabaseProvider: provider,
      sqliteProvider: SqliteProvider(
        'my_repository.sqlite',
        databaseFactory: databaseFactory,
        modelDictionary: sqliteModelDictionary,
      ),
      migrations: migrations,
      offlineRequestQueue: queue,
      memoryCacheProvider: MemoryCacheProvider(),
    );
  }
}
