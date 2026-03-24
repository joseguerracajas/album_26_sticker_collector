import 'package:path/path.dart' as p; // Necesitas la librería 'path'
import 'package:sqflite/sqflite.dart';
import 'package:album_26_sticker_collector/brick/brick.g.dart';
import 'package:album_26_sticker_collector/brick/db/schema.g.dart';
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
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

  // Cambiamos a Future porque ahora necesitamos esperar las rutas y la inicialización
  static Future<void> configure({
    required String supabaseUrl,
    required String supabaseAnonKey,
  }) async {
    final (client, queue) = OfflineFirstWithSupabaseRepository.clientQueue(
      databaseFactory: databaseFactory,
    );

    final provider = SupabaseProvider(
      SupabaseClient(supabaseUrl, supabaseAnonKey, httpClient: client),
      modelDictionary: supabaseModelDictionary,
    );

    // 1. OBTENEMOS LA RUTA CORRECTA PARA SQLite
    final databasesPath = await getDatabasesPath();
    final dbPath = p.join(databasesPath, 'album_offline_v1.sqlite');

    _singleton = AppRepository._(
      supabaseProvider: provider,
      sqliteProvider: SqliteProvider(
        dbPath, // Usamos la ruta completa
        databaseFactory: databaseFactory,
        modelDictionary: sqliteModelDictionary,
      ),
      migrations: migrations,
      offlineRequestQueue: queue,
      memoryCacheProvider: MemoryCacheProvider(),
    );

    // 2. ¡MÁXIMA IMPORTANCIA!: Inicializar para correr migraciones
    await _singleton!.initialize();
  }
}
