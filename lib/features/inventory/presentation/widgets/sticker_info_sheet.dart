import 'package:album_26_sticker_collector/features/catalog/domain/sticker.model.dart';
import 'package:album_26_sticker_collector/features/inventory/data/inventory_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bottom sheet que muestra el estado del cromo en el inventario
/// y permite añadir o reducir la cantidad con un toque.
class StickerInfoSheet extends ConsumerWidget {
  const StickerInfoSheet({super.key, required this.sticker});

  final Sticker sticker;

  /// Muestra el sheet deslizable desde la parte inferior.
  static Future<void> show(BuildContext context, Sticker sticker) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => StickerInfoSheet(sticker: sticker),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final inventoryAsync = ref.watch(inventoryProvider);

    final stickerInventory =
        inventoryAsync.asData?.value[sticker.id] ?? const {};
    final totalQty = stickerInventory.values.fold(0, (sum, q) => sum + q);
    final stickerLabel = '${sticker.categoryId} ${sticker.stickerCode}';

    return Container(
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Barrita de arrastre
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // Código del cromo
          Text(
            stickerLabel,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          // Descripción opcional
          if (sticker.description != null && sticker.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                sticker.description!,
                style: const TextStyle(color: Colors.white60, fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

          const SizedBox(height: 28),

          // Chip de estado
          _StatusChip(quantity: totalQty, l10n: l10n),

          const SizedBox(height: 32),

          // Controles de cantidad
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón restar
              _CircleButton(
                icon: Icons.remove_rounded,
                color: totalQty > 0 ? Colors.redAccent : Colors.grey.shade700,
                enabled: totalQty > 0,
                onTap: () {
                  HapticFeedback.lightImpact();
                  ref
                      .read(inventoryProvider.notifier)
                      .updateVariantQuantity(sticker.id, 'normal', -1);
                },
              ),

              const SizedBox(width: 32),

              // Contador
              Text(
                '$totalQty',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 32),

              // Botón sumar
              _CircleButton(
                icon: Icons.add_rounded,
                color: Colors.amber,
                enabled: true,
                onTap: () {
                  HapticFeedback.lightImpact();
                  ref
                      .read(inventoryProvider.notifier)
                      .updateVariantQuantity(sticker.id, 'normal', 1);
                },
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            l10n.lookupQtyLabel,
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),

          const SizedBox(height: 28),

          // Botón cerrar
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white70,
                side: const BorderSide(color: Colors.white24),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.commonDone,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Chip de estado ───────────────────────────────────────────────────────────

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.quantity, required this.l10n});

  final int quantity;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final String label;
    final IconData icon;

    if (quantity == 0) {
      color = Colors.redAccent;
      label = l10n.lookupStatusMissing;
      icon = Icons.search_off_rounded;
    } else if (quantity == 1) {
      color = Colors.green;
      label = l10n.lookupStatusCollected;
      icon = Icons.check_circle_outline_rounded;
    } else {
      color = Colors.blue.shade300;
      // Los repetidos son todo lo que está por encima de 1
      label = l10n.lookupStatusDuplicates(quantity - 1);
      icon = Icons.content_copy_rounded;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Botón circular ───────────────────────────────────────────────────────────

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    required this.color,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: enabled ? 0.15 : 0.06),
          border: Border.all(
            color: color.withValues(alpha: enabled ? 0.5 : 0.2),
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: enabled ? color : Colors.grey.shade700,
          size: 30,
        ),
      ),
    );
  }
}
