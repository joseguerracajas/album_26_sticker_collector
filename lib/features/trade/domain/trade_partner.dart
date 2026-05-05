// Archivo: lib/features/trade/domain/trade_partner.dart

class TradePartner {
  final String userId;
  final String tradeCode;
  final String? email;

  const TradePartner({
    required this.userId,
    required this.tradeCode,
    this.email,
  });

  /// Display name: primeras letras del email o "Usuario"
  String get displayName {
    if (email == null || email!.isEmpty) return 'Usuario';
    final local = email!.split('@').first;
    return local.length > 18 ? '${local.substring(0, 18)}…' : local;
  }
}
