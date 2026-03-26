// Archivo: lib/features/inventory/domain/inventory.dart

import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'inventory'),
)
class Inventory extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'user_id')
  final String userId;

  @Supabase(name: 'sticker_id')
  final String stickerId;

  @Supabase(name: 'variant_id')
  final String variantId;

  @Supabase(name: 'quantity')
  final int quantity;

  @Supabase(name: 'last_updated')
  final DateTime? lastUpdated;

  Inventory({
    String? id,
    required this.userId,
    required this.stickerId,
    required this.variantId,
    this.quantity = 0,
    this.lastUpdated,
  }) : id = id ?? const Uuid().v4();
}
