// Archivo: lib/features/trade/domain/trade_session.dart

class TradeSession {
  final String id;
  final String initiatorId;
  final String receiverId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Emails resueltos (pueden ser null si no se cargaron)
  final String? initiatorEmail;
  final String? receiverEmail;

  const TradeSession({
    required this.id,
    required this.initiatorId,
    required this.receiverId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.initiatorEmail,
    this.receiverEmail,
  });

  factory TradeSession.fromJson(Map<String, dynamic> json) {
    return TradeSession(
      id: json['id'] as String,
      initiatorId: json['initiator_id'] as String,
      receiverId: json['receiver_id'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      initiatorEmail: json['initiator_email'] as String?,
      receiverEmail: json['receiver_email'] as String?,
    );
  }

  TradeSession copyWith({
    String? status,
    String? initiatorEmail,
    String? receiverEmail,
  }) {
    return TradeSession(
      id: id,
      initiatorId: initiatorId,
      receiverId: receiverId,
      status: status ?? this.status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      initiatorEmail: initiatorEmail ?? this.initiatorEmail,
      receiverEmail: receiverEmail ?? this.receiverEmail,
    );
  }

  bool get isActive => !['completed', 'cancelled'].contains(status);

  bool get isPendingAcceptance => status == 'pending_acceptance';
  bool get isSelecting => status == 'selecting';
  bool get isInitiatorConfirmed => status == 'initiator_confirmed';
  bool get isReceiverConfirmed => status == 'receiver_confirmed';
  bool get isReserved => status == 'reserved';
  bool get isCompleted => status == 'completed';
  bool get isCancelled => status == 'cancelled';

  bool get bothConfirmed =>
      status == 'initiator_confirmed' ||
      status == 'receiver_confirmed' ||
      isReserved;

  String partnerIdFor(String myId) =>
      myId == initiatorId ? receiverId : initiatorId;

  String? partnerEmailFor(String myId) =>
      myId == initiatorId ? receiverEmail : initiatorEmail;
}
