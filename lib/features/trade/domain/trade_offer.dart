// Archivo: lib/features/trade/domain/trade_offer.dart

class TradeOffer {
  final String id;
  final String tradeSessionId;
  final String offererId;
  final String stickerId;
  final int quantity;
  final bool delivered;
  final DateTime createdAt;

  const TradeOffer({
    required this.id,
    required this.tradeSessionId,
    required this.offererId,
    required this.stickerId,
    required this.quantity,
    required this.delivered,
    required this.createdAt,
  });

  factory TradeOffer.fromJson(Map<String, dynamic> json) {
    return TradeOffer(
      id: json['id'] as String,
      tradeSessionId: json['trade_session_id'] as String,
      offererId: json['offerer_id'] as String,
      stickerId: json['sticker_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      delivered: json['delivered'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  TradeOffer copyWith({bool? delivered}) {
    return TradeOffer(
      id: id,
      tradeSessionId: tradeSessionId,
      offererId: offererId,
      stickerId: stickerId,
      quantity: quantity,
      delivered: delivered ?? this.delivered,
      createdAt: createdAt,
    );
  }
}
