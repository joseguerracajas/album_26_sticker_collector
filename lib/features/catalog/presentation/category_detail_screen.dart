// Archivo: lib/features/catalog/presentation/category_detail_screen.dart

import 'package:album_26_sticker_collector/features/catalog/domain/category.model.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_filter_search.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/sticker_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickerSearchNotifier extends Notifier<String> {
  @override
  String build() => '';
  void updateQuery(String query) => state = query;
}

final stickerSearchProvider = NotifierProvider<StickerSearchNotifier, String>(
  StickerSearchNotifier.new,
);

class CategoryDetailScreen extends ConsumerWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: Column(
        children: [
          StickerFilterSearch(ref: ref),
          StickerGrid(category: category, ref: ref),
        ],
      ),
    );
  }
}
