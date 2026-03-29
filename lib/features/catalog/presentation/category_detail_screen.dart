// Archivo: lib/features/catalog/presentation/category_detail_screen.dart

import 'package:album_26_sticker_collector/features/catalog/data/sync_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailScreen extends ConsumerWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. El Scaffold va AFUERA para que el AppBar se quede fijo arriba
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),

      // 4. El RefreshIndicator va ADENTRO, envolviendo la zona de scroll
      body: RefreshIndicator(
        color: Colors.amber,
        backgroundColor: const Color(0xFF1E1E1E),
        onRefresh: ref.read(syncServiceProvider).refreshAll,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const StickerFilterSearch(),
              StickerGrid(
                category: category,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Faltaba el 'const' aquí
              ),
            ],
          ),
        ),
      ),
    );
  }
}
