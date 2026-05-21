import 'package:album_26_sticker_collector/core/tutorial/tutorial_keys.dart';
import 'package:album_26_sticker_collector/core/tutorial/variant_tutorial.dart';
import 'package:album_26_sticker_collector/features/catalog/data/album_variant_provider.dart';
import 'package:album_26_sticker_collector/features/catalog/domain/album_variant.model.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bottom sheet que permite al usuario ver y cambiar la variante geográfica
/// del álbum activo (ej. LATAM, Europa, USA).
///
/// Uso:
/// ```dart
/// VariantSelectorSheet.show(context);
/// // Obligatorio (no se puede cerrar sin elegir):
/// VariantSelectorSheet.show(context, mandatory: true);
/// ```
class VariantSelectorSheet extends ConsumerStatefulWidget {
  final bool mandatory;
  const VariantSelectorSheet({super.key, this.mandatory = false});

  static Future<void> show(BuildContext context, {bool mandatory = false}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: !mandatory,
      enableDrag: !mandatory,
      builder: (_) => VariantSelectorSheet(mandatory: mandatory),
    );
  }

  @override
  ConsumerState<VariantSelectorSheet> createState() =>
      _VariantSelectorSheetState();
}

class _VariantSelectorSheetState extends ConsumerState<VariantSelectorSheet> {
  @override
  void initState() {
    super.initState();
    if (widget.mandatory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) VariantTutorial.show(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mandatory = widget.mandatory;
    final l10n = AppLocalizations.of(context);
    final variantsAsync = ref.watch(activeAlbumVariantsProvider);
    final prefAsync = ref.watch(activeVariantPreferenceProvider);
    final albumAsync = ref.watch(activeAlbumProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar (solo si no es obligatorio)
          const SizedBox(height: 12),
          if (!mandatory)
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          const SizedBox(height: 20),

          // Título
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Icon(Icons.public, color: Colors.amber, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mandatory
                            ? l10n.variantMandatoryTitle
                            : l10n.variantSheetTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (mandatory)
                        Text(
                          l10n.variantMandatorySubtitle,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 13,
                          ),
                        )
                      else
                        albumAsync.when(
                          data: (album) => Text(
                            album?.name ?? '',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),
                          ),
                          loading: () => const SizedBox.shrink(),
                          error: (_, _) => const SizedBox.shrink(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (!mandatory)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.variantSheetInventoryNote,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF2A2A2A), height: 1),
          const SizedBox(height: 8),

          // Lista de variantes
          variantsAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(color: Colors.amber),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                l10n.variantSheetLoadError(e.toString()),
                style: const TextStyle(color: Colors.red),
              ),
            ),
            data: (variants) {
              if (variants.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l10n.variantSheetEmpty,
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              final currentVariantId = prefAsync.asData?.value?.albumVariantId;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: variants.length,
                itemBuilder: (context, index) {
                  final variant = variants[index];
                  final isSelected = variant.id == currentVariantId;
                  final tile = _VariantTile(
                    variant: variant,
                    isSelected: isSelected,
                    defaultLabel: l10n.variantSheetDefaultLabel,
                    onTap: () async {
                      if (isSelected) {
                        Navigator.pop(context);
                        return;
                      }
                      HapticFeedback.selectionClick();
                      await ref
                          .read(activeVariantPreferenceProvider.notifier)
                          .switchVariant(variant.id);
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    l10n.variantChangedSuccess(variant.name),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: const Color(0xFF1E1E1E),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }
                    },
                  );
                  if (index == 0) {
                    return KeyedSubtree(
                      key: tutorialVariantListKey,
                      child: tile,
                    );
                  }
                  return tile;
                },
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _VariantTile extends StatelessWidget {
  final AlbumVariant variant;
  final bool isSelected;
  final String defaultLabel;
  final VoidCallback onTap;

  const _VariantTile({
    required this.variant,
    required this.isSelected,
    required this.defaultLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.amber.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.amber : Colors.grey.shade800,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Icono de globo por región
            Text(
              _regionEmoji(variant.name),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    variant.name,
                    style: TextStyle(
                      color: isSelected ? Colors.amber : Colors.white,
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  if (variant.isDefault)
                    Text(
                      defaultLabel,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.amber, size: 22)
            else
              Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey.shade600,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  String _regionEmoji(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('latam') || lower.contains('sudamer')) return '🌎';
    if (lower.contains('europa') || lower.contains('europe')) return '🌍';
    if (lower.contains('usa') || lower.contains('north')) return '🦅';
    if (lower.contains('asia')) return '🌏';
    if (lower.contains('africa')) return '🌍';
    return '🏴';
  }
}
