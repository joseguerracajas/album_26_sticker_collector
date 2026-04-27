import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

/// Join table that controls which stickers appear in each album variant.
///
/// A sticker missing from this table for a given variant is hidden from the UI
/// for users on that variant — but their inventory quantities are NEVER deleted.
/// Switching back to a previous variant restores all prior quantities.
@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'album_variant_stickers'),
)
class AlbumVariantSticker extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'album_variant_id')
  final String albumVariantId;

  @Supabase(name: 'sticker_id')
  final String stickerId;

  AlbumVariantSticker({
    required this.id,
    required this.albumVariantId,
    required this.stickerId,
  });
}
