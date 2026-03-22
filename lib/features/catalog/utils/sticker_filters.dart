// Archivo: lib/features/catalog/utils/sticker_filters.dart

import 'package:album_26_sticker_collector/features/catalog/domain/category.dart';

import '../domain/sticker.dart';
import '../presentation/category_detail_screen.dart'; // Importamos el enum FilterOption

/// Función pura para filtrar la lista de cromos según el estado y la búsqueda
List<Sticker> aplicarFiltrosCromos({
  required List<Sticker> stickers,
  required Map<String, dynamic> inventarioGlobal,
  required FilterOption filtroActual,
  required String busqueda,
  required Category category,
}) {
  return stickers.where((sticker) {
    // 1. Calculamos el total de este cromo en el inventario
    final miInventario = inventarioGlobal[sticker.id] ?? {};
    int totalCromos = 0;
    miInventario.values.forEach((cantidad) => totalCromos += (cantidad as int));

    // 2. Filtro por estado (Todos, Faltantes, Repetidas)
    bool matchesStatus = true;
    switch (filtroActual) {
      case FilterOption.faltantes:
        matchesStatus = totalCromos == 0;
        break;
      case FilterOption.repetidas:
        matchesStatus = totalCromos > 1;
        break;
      case FilterOption.todos:
      default:
        matchesStatus = true;
    }

    // 3. Filtro por Búsqueda (Texto multi-criterio)
    final terminoBusquedaCompleto =
        '${category.name} ${category.id} ${sticker.stickerCode}'.toLowerCase();
    bool matchesSearch = terminoBusquedaCompleto.contains(
      busqueda.toLowerCase().trim(),
    );

    return matchesStatus && matchesSearch;
  }).toList();
}
