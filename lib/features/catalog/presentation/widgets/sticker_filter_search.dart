import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterOption { todos, faltantes, repetidas }

// --- 1. NOTIFIER PARA EL FILTRO ---
// En Riverpod 3.x manual, extendemos de Notifier directamente.
// El "truco" es que el estado se maneja internamente por el Provider.
class FilterNotifier extends Notifier<FilterOption> {
  @override
  FilterOption build() => FilterOption.todos;

  void changeFilter(FilterOption newFilter) => state = newFilter;
}

// Aquí es donde aplicamos el .autoDispose
final filterProvider =
    NotifierProvider.autoDispose<FilterNotifier, FilterOption>(
      FilterNotifier.new,
    );

// --- 2. NOTIFIER PARA EL BUSCADOR ---
class StickerSearchNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateQuery(String query) => state = query;
}

final stickerSearchProvider =
    NotifierProvider.autoDispose<StickerSearchNotifier, String>(
      StickerSearchNotifier.new,
    );

// --- 3. COMPONENTE VISUAL ---
class StickerFilterSearch extends ConsumerStatefulWidget {
  const StickerFilterSearch({super.key});

  @override
  ConsumerState<StickerFilterSearch> createState() =>
      _StickerFilterSearchState();
}

class _StickerFilterSearchState extends ConsumerState<StickerFilterSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentFilter = ref.watch(filterProvider);
    final searchQuery = ref.watch(stickerSearchProvider);

    return Column(
      children: [
        // BOTONES DE FILTRO
        Padding(
          key: tutorialFilterBarKey,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton<FilterOption>(
              style: SegmentedButton.styleFrom(
                backgroundColor: Colors.transparent,
                selectedBackgroundColor: Colors.amber.withValues(alpha: 0.2),
                selectedForegroundColor: Colors.amber,
              ),
              segments: [
                ButtonSegment(
                  value: FilterOption.todos,
                  label: Text(l10n.filterAll),
                ),
                ButtonSegment(
                  value: FilterOption.faltantes,
                  label: Text(l10n.filterMissing),
                ),
                ButtonSegment(
                  value: FilterOption.repetidas,
                  label: Text(l10n.filterDuplicates),
                ),
              ],
              selected: {currentFilter},
              onSelectionChanged: (set) =>
                  ref.read(filterProvider.notifier).changeFilter(set.first),
            ),
          ),
        ),

        // BUSCADOR
        Padding(
          key: tutorialStickerSearchKey,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            controller: _searchController,
            autocorrect: false,
            enableSuggestions: true,
            onChanged: (val) =>
                ref.read(stickerSearchProvider.notifier).updateQuery(val),
            decoration: InputDecoration(
              hintText: l10n.filterSearchHint,
              prefixIcon: const Icon(Icons.search, color: Colors.amber),
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 18,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        ref
                            .read(stickerSearchProvider.notifier)
                            .updateQuery('');
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : null,
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
