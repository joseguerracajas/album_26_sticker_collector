import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:album_26_sticker_collector/features/catalog/presentation/category_detail_screen.dart';

enum FilterOption { todos, faltantes, repetidas }

class FilterNotifier extends Notifier<FilterOption> {
  @override
  FilterOption build() => FilterOption.todos;
  void changeFilter(FilterOption newFilter) => state = newFilter;
}

final filterProvider = NotifierProvider<FilterNotifier, FilterOption>(
  FilterNotifier.new,
);

class StickerFilterSearch extends StatelessWidget {
  final WidgetRef ref;
  const StickerFilterSearch({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final currentFilter = ref.watch(filterProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton<FilterOption>(
              style: SegmentedButton.styleFrom(
                backgroundColor: Colors.transparent,
                selectedBackgroundColor: Colors.amber.withValues(alpha: 0.2),
                selectedForegroundColor: Colors.amber,
              ),
              segments: const [
                ButtonSegment(value: FilterOption.todos, label: Text('Todos')),
                ButtonSegment(
                  value: FilterOption.faltantes,
                  label: Text('Faltantes'),
                ),
                ButtonSegment(
                  value: FilterOption.repetidas,
                  label: Text('Repetidas'),
                ),
              ],
              selected: {currentFilter},
              onSelectionChanged: (set) =>
                  ref.read(filterProvider.notifier).changeFilter(set.first),
            ),
          ),
        ),

        // 2. BUSCADOR
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            onChanged: (val) =>
                ref.read(stickerSearchProvider.notifier).updateQuery(val),
            decoration: InputDecoration(
              hintText: 'Buscar país, código o número...',
              prefixIcon: const Icon(Icons.search, color: Colors.amber),
              filled: true,
              fillColor: const Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
