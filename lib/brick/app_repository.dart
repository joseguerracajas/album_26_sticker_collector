import 'package:path/path.dart' as p; // Necesitas la librería 'path'
import 'package:sqflite/sqflite.dart';
import 'package:album_26_sticker_collector/brick/brick.g.dart';
import 'package:album_26_sticker_collector/brick/db/schema.g.dart';
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:brick_supabase/brick_supabase.dart' hide Supabase;

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
      // Excluir rutas de trade: no deben ser encoladas/reintentadas por Brick.
      // Las operaciones de trade deben fallar rápido y que el usuario reintente.
      ignorePaths: const {
        '/auth/v1',
        '/storage/v1',
        '/rest/v1/rpc/',
        '/rest/v1/trade_sessions',
        '/rest/v1/trade_offers',
        '/rest/v1/user_trade_codes',
      },
    );

    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
      httpClient: client,
    );

    final provider = SupabaseProvider(
      Supabase.instance.client,
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

    // Limpiar solicitudes RPC heredadas de la cola offline antes de arrancar
    await clearQueuedRpcRequests();

    // 2. ¡MÁXIMA IMPORTANCIA!: Inicializar para correr migraciones
    await _singleton!.initialize();
  }

  void startSyncQueue() {
    offlineRequestQueue.start();
  }

  void stopSyncQueue() {
    offlineRequestQueue.stop();
  }

  /// Elimina de la cola offline cualquier request encolada a endpoints /rpc/
  /// que ya no se usan. Llámarse al inicio de la app para limpiar
  /// solicitudes heredadas que de lo contrario se reintentan indefinidamente.
  static Future<void> clearQueuedRpcRequests() async {
    try {
      final dbPath = p.join(
        await getDatabasesPath(),
        'brick_offline_queue.sqlite',
      );
      final db = await openDatabase(dbPath);
      await db.delete('HttpJobs', where: 'url LIKE ?', whereArgs: ['%/rpc/%']);
      await db.close();
    } catch (_) {
      // Si el archivo no existe todavía, no hay nada que limpiar.
    }
  }
}
