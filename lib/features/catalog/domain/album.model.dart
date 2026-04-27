import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'albums'),
)
class Album extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true, name: 'id')
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'name')
  final String name;

  @Supabase(name: 'year')
  final int year;

  /// Whether this is the currently active album shown by default in the app.
  @Supabase(name: 'is_active')
  final bool isActive;

  @Supabase(name: 'cover_url')
  final String? coverUrl;

  Album({
    required this.id,
    required this.name,
    required this.year,
    required this.isActive,
    this.coverUrl,
  });

  Album copyWith({
    String? id,
    String? name,
    int? year,
    bool? isActive,
    String? coverUrl,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      isActive: isActive ?? this.isActive,
      coverUrl: coverUrl ?? this.coverUrl,
    );
  }
}
