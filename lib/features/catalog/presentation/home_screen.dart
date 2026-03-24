// Archivo: lib/features/catalog/presentation/home_screen.dart

import 'package:album_26_sticker_collector/features/catalog/presentation/global_collection_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/widgets/category_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/profile_screen.dart';
import 'category_detail_screen.dart';
import '../data/categories_provider.dart';
import '../data/stickers_provider.dart';
import '../../inventory/data/stats_provider.dart';
import '../../inventory/data/inventory_provider.dart';
import '../../inventory/data/share_provider.dart';

// --- ESTADO DEL BUSCADOR (RIVERPOD 2.0 Seguro) ---
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateQuery(String query) => state = query;
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCromosAsync = ref.watch(totalStickersCountProvider);
    final cromosUnicos = ref.watch(uniqueCollectedProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Mi Álbum 26',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.grey, size: 28),
          tooltip: 'Mi Perfil',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final isLoading = ref.watch(shareProvider);

              if (isLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                );
              }

              // Menú desplegable con las 3 opciones
              return PopupMenuButton<ShareType>(
                icon: const Icon(Icons.share, color: Colors.amber),
                color: const Color(0xFF1E1E1E),
                onSelected: (ShareType tipo) async {
                  try {
                    await ref
                        .read(shareProvider.notifier)
                        .generarYCompartirLista(tipo);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<ShareType>>[
                      const PopupMenuItem<ShareType>(
                        value: ShareType.todos,
                        child: ListTile(
                          leading: Icon(Icons.list_alt, color: Colors.amber),
                          title: Text(
                            'Compartir Todo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const PopupMenuItem<ShareType>(
                        value: ShareType.faltantes,
                        child: ListTile(
                          leading: Icon(Icons.close, color: Colors.redAccent),
                          title: Text(
                            'Solo Faltantes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const PopupMenuItem<ShareType>(
                        value: ShareType.repetidos,
                        child: ListTile(
                          leading: Icon(
                            Icons.repeat,
                            color: Colors.greenAccent,
                          ),
                          title: Text(
                            'Solo Repetidas',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- TARJETA DORADA GLOBAL ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.amber.shade400, Colors.amber.shade800],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: totalCromosAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
                error: (e, s) =>
                    const Text('Error', style: TextStyle(color: Colors.black)),
                data: (total) {
                  final porcentaje = total == 0
                      ? 0.0
                      : (cromosUnicos / total) * 100;
                  final progresoDecimal = total == 0
                      ? 0.0
                      : (cromosUnicos / total);

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Text(
                              'Progreso Global',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${porcentaje.toStringAsFixed(1)}%',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progresoDecimal,
                          backgroundColor: Colors.black12,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          minHeight: 10,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '$cromosUnicos de $total coleccionadas',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          icon: const Icon(Icons.style),
                          label: const Text(
                            'Ver Colección Completa',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const GlobalCollectionScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Text(
              'Equipos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // --- BUSCADOR ---
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 4.0,
            ),
            child: TextField(
              onChanged: (value) =>
                  ref.read(searchQueryProvider.notifier).updateQuery(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar país o equipo...',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.amber,
                  size: 20,
                ),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 18,
                        ),
                        onPressed: () {
                          ref
                              .read(searchQueryProvider.notifier)
                              .updateQuery('');
                          FocusScope.of(
                            context,
                          ).unfocus(); // Ocultar teclado al borrar
                        },
                      )
                    : null,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // --- LISTA DE EQUIPOS ---
          Expanded(
            child: categoriesAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
              error: (e, s) => Center(
                child: Text(
                  'Error: $e',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              data: (categorias) {
                final filtered = categorias
                    .where(
                      (c) =>
                          c.name.toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          ) ||
                          c.id.toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          ),
                    )
                    .toList();

                if (filtered.isEmpty) {
                  return const Center(
                    child: Text(
                      'Sin resultados',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) =>
                      _CategoryTile(category: filtered[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET DE CADA PAÍS (CON ICONO DINÁMICO Y PROGRESO INDIVIDUAL) ---
class _CategoryTile extends ConsumerWidget {
  final dynamic category;
  const _CategoryTile({required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stickersAsync = ref.watch(stickersByCategoryProvider(category.id));
    final inventoryAsync = ref.watch(inventoryProvider);

    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailScreen(category: category),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // --- CIRCLE AVATAR DINÁMICO ---
              CategoryAvatar(iconUrl: category.iconUrl, text: category.id),
              const SizedBox(width: 16),

              // --- DATOS DEL PAÍS Y BARRA DE PROGRESO ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    stickersAsync.when(
                      loading: () => const LinearProgressIndicator(
                        color: Colors.amber,
                        minHeight: 2,
                      ),
                      error: (e, s) => const SizedBox.shrink(),
                      data: (stickers) {
                        int total = stickers.length;
                        int unicos = 0;
                        for (var s in stickers) {
                          final inv = inventoryAsync.value?[s.id] ?? {};
                          int sum = 0;
                          inv.values.forEach((v) => sum += v);
                          if (sum > 0) unicos++;
                        }
                        final double progreso = total == 0 ? 0 : unicos / total;

                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: progreso,
                                      backgroundColor: Colors.black45,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                            Colors.amber,
                                          ),
                                      minHeight: 6,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${(progreso * 100).toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '$unicos de $total obtenidos',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white24,
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget de respaldo si no hay URL para la bandera/escudo
  Widget _buildFallback(String id) {
    return Center(
      child: Text(
        id.substring(0, id.length > 2 ? 2 : id.length).toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
