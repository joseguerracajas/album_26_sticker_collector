// Archivo: lib/features/inventory/domain/inventory.dart

import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'inventory'),
)
class Inventory extends OfflineFirstWithSupabaseModel {
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
    required this.userId,
    required this.stickerId,
    required this.variantId,
    this.quantity = 0,
    this.lastUpdated,
  });
}
