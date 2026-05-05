// Archivo: lib/features/trade/data/trade_provider.dart

import 'dart:math';

import 'package:album_26_sticker_collector/features/trade/domain/trade_offer.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_partner.dart';
import 'package:album_26_sticker_collector/features/trade/domain/trade_session.dart';
import 'package:album_26_sticker_collector/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ─────────────────────────────────────────────────────────────────────────────
// PROVIDERS BÁSICOS
// ─────────────────────────────────────────────────────────────────────────────

/// Código de intercambio del usuario actual.
/// Usa GET (SELECT) para no ser interceptado por la offline queue de Brick.
/// La offline queue de Brick solo encola escrituras (POST/PATCH/DELETE),
/// las lecturas (GET) pasan directamente a la red.
final myTradeCodeProvider = FutureProvider<String>((ref) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) throw 'trade_error_not_logged_in';

  // GET → no es encolado por Brick offline queue
  final existing = await supabase
      .from('user_trade_codes')
      .select('trade_code')
      .eq('user_id', userId)
      .maybeSingle();

  if (existing != null) return existing['trade_code'] as String;

  // Generar código numérico único de 6 dígitos usando Random.secure()
  final rng = Random.secure();
  String newCode = '';
  bool unique = false;
  while (!unique) {
    newCode = (100000 + rng.nextInt(900000)).toString();
    final check = await supabase
        .from('user_trade_codes')
        .select('trade_code')
        .eq('trade_code', newCode)
        .maybeSingle();
    unique = check == null;
  }

  await supabase.from('user_trade_codes').insert({
    'user_id': userId,
    'trade_code': newCode,
  });

  return newCode;
});

/// Sesiones activas del usuario (puede tener varias al mismo tiempo)
final activeTradeSessionsProvider = StreamProvider<List<TradeSession>>((
  ref,
) async* {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) {
    yield [];
    return;
  }

  yield* supabase
      .from('trade_sessions')
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: false)
      .map((rows) {
        return rows
            .where((r) {
              final status = r['status'] as String;
              final isParticipant =
                  r['initiator_id'] == userId || r['receiver_id'] == userId;
              final isActive = !['completed', 'cancelled'].contains(status);
              return isParticipant && isActive;
            })
            .map((r) => TradeSession.fromJson(r))
            .toList();
      });
});

/// Ofertas para una sesión determinada
final tradeOffersProvider = StreamProvider.family<List<TradeOffer>, String>((
  ref,
  sessionId,
) {
  return supabase
      .from('trade_offers')
      .stream(primaryKey: ['id'])
      .eq('trade_session_id', sessionId)
      .map((rows) => rows.map(TradeOffer.fromJson).toList());
});

/// Stream de una sesión concreta — para reflejar cambios en tiempo real
/// dentro de la pantalla de negociación.
final tradeSessionStreamProvider = StreamProvider.family<TradeSession?, String>(
  (ref, sessionId) {
    return supabase
        .from('trade_sessions')
        .stream(primaryKey: ['id'])
        .eq('id', sessionId)
        .map((rows) => rows.isEmpty ? null : TradeSession.fromJson(rows.first));
  },
);

/// Historial de sesiones terminadas (completed o cancelled)
final tradeHistoryProvider = FutureProvider<List<TradeSession>>((ref) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return [];

  final rows = await supabase
      .from('trade_sessions')
      .select()
      .or('initiator_id.eq.$userId,receiver_id.eq.$userId')
      .inFilter('status', ['completed', 'cancelled'])
      .order('updated_at', ascending: false)
      .limit(50);

  return (rows as List).map((r) => TradeSession.fromJson(r)).toList();
});

/// Map stickerId → cantidad que YO estoy ofreciendo en trades activos
/// Incluye estados: selecting, initiator_confirmed, receiver_confirmed, reserved
final myReservedStickerCountsProvider = FutureProvider<Map<String, int>>((
  ref,
) async {
  final userId = supabase.auth.currentUser?.id;
  if (userId == null) return {};

  final sessions = await supabase
      .from('trade_sessions')
      .select('id')
      .or('initiator_id.eq.$userId,receiver_id.eq.$userId')
      .inFilter('status', [
        'selecting',
        'initiator_confirmed',
        'receiver_confirmed',
        'reserved',
      ]);

  if ((sessions as List).isEmpty) return {};

  final sessionIds = sessions.map((s) => s['id'] as String).toList();

  final offers = await supabase
      .from('trade_offers')
      .select()
      .eq('offerer_id', userId)
      .inFilter('trade_session_id', sessionIds)
      .eq('delivered', false);

  final Map<String, int> counts = {};
  for (final o in (offers as List)) {
    final stickerId = o['sticker_id'] as String;
    final qty = (o['quantity'] as num).toInt();
    counts[stickerId] = (counts[stickerId] ?? 0) + qty;
  }
  return counts;
});

/// StickerIds que YO ya ofrecí en OTRAS sesiones activas (no la actual).
/// Útil en la pantalla de negociación para deshabilitar cromos ya comprometidos.
final offeredInOtherSessionsProvider =
    FutureProvider.family<Set<String>, String>((ref, currentSessionId) async {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) return {};

      final sessions = await supabase
          .from('trade_sessions')
          .select('id')
          .or('initiator_id.eq.$userId,receiver_id.eq.$userId')
          .inFilter('status', [
            'selecting',
            'initiator_confirmed',
            'receiver_confirmed',
            'reserved',
          ])
          .neq('id', currentSessionId);

      if ((sessions as List).isEmpty) return {};

      final sessionIds = sessions.map((s) => s['id'] as String).toList();

      final offers = await supabase
          .from('trade_offers')
          .select('sticker_id')
          .eq('offerer_id', userId)
          .inFilter('trade_session_id', sessionIds)
          .eq('delivered', false);

      return {for (final o in (offers as List)) o['sticker_id'] as String};
    });

// ─────────────────────────────────────────────────────────────────────────────
// NOTIFIER DE ACCIONES
// ─────────────────────────────────────────────────────────────────────────────

class TradeActionsNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  // ── Buscar usuario por código ─────────────────────────────────────────────
  // Usa GET (SELECT) para no ser encolado por Brick offline queue.
  // La RPC find_user_by_trade_code usaba POST y era encolada/reintentada.
  Future<TradePartner?> findUserByCode(String code) async {
    final row = await supabase
        .from('user_trade_codes')
        .select('user_id, trade_code')
        .eq('trade_code', code.trim())
        .maybeSingle();

    if (row == null) return null;
    return TradePartner(
      userId: row['user_id'] as String,
      tradeCode: row['trade_code'] as String,
    );
  }

  // ── Iniciar intercambio ───────────────────────────────────────────────────

  Future<TradeSession> initiateSession(String receiverId) async {
    final myId = supabase.auth.currentUser!.id;

    // Solo verificar que no exista ya una sesión activa con ESTE mismo receptor
    final existing = await supabase
        .from('trade_sessions')
        .select('id')
        .or(
          'and(initiator_id.eq.$myId,receiver_id.eq.$receiverId),and(initiator_id.eq.$receiverId,receiver_id.eq.$myId)',
        )
        .not('status', 'in', '("completed","cancelled")')
        .limit(1);

    if ((existing as List).isNotEmpty) {
      throw 'trade_error_already_with_partner';
    }

    final res = await supabase
        .from('trade_sessions')
        .insert({
          'initiator_id': myId,
          'receiver_id': receiverId,
          'status': 'pending_acceptance',
        })
        .select()
        .single();

    ref.invalidate(activeTradeSessionsProvider);
    return TradeSession.fromJson(res);
  }

  // ── Aceptar solicitud ─────────────────────────────────────────────────────

  Future<void> acceptSession(String sessionId) async {
    await supabase
        .from('trade_sessions')
        .update({'status': 'selecting'})
        .eq('id', sessionId);
    ref.invalidate(activeTradeSessionsProvider);
  }

  // ── Rechazar solicitud ────────────────────────────────────────────────────

  Future<void> rejectSession(String sessionId) async {
    await supabase
        .from('trade_sessions')
        .update({'status': 'cancelled'})
        .eq('id', sessionId);
    ref.invalidate(
      tradeHistoryProvider,
    ); // Esperar a que la BD confirme antes de refrescar el stream de activos
    Future.delayed(const Duration(milliseconds: 600), () {
      ref.invalidate(activeTradeSessionsProvider);
    }); // Esperar a que la BD confirme antes de refrescar el stream de activos
    Future.delayed(const Duration(milliseconds: 600), () {
      ref.invalidate(activeTradeSessionsProvider);
    });
  }

  // ── Guardar mi selección de cromos ───────────────────────────────────────

  /// [offers] = { stickerId: quantity }
  Future<void> saveMyOffers(String sessionId, Map<String, int> offers) async {
    final myId = supabase.auth.currentUser!.id;

    // Eliminar ofertas previas del usuario en esta sesión
    await supabase
        .from('trade_offers')
        .delete()
        .eq('trade_session_id', sessionId)
        .eq('offerer_id', myId);

    if (offers.isNotEmpty) {
      final rows = offers.entries
          .map(
            (e) => {
              'trade_session_id': sessionId,
              'offerer_id': myId,
              'sticker_id': e.key,
              'quantity': e.value,
              'delivered': false,
            },
          )
          .toList();

      await supabase.from('trade_offers').insert(rows);
    }
  }

  // ── Confirmar mi oferta (bloquear selección) ──────────────────────────────

  Future<void> confirmMyOffer(
    TradeSession session,
    Map<String, int> offers,
  ) async {
    final myId = supabase.auth.currentUser!.id;

    // Primero guardar la selección final
    await saveMyOffers(session.id, offers);

    // Determinar qué estado poner
    final isInitiator = session.initiatorId == myId;
    String newStatus;

    if (session.status == 'selecting') {
      newStatus = isInitiator ? 'initiator_confirmed' : 'receiver_confirmed';
    } else if (session.status == 'initiator_confirmed' && !isInitiator) {
      newStatus = 'reserved';
    } else if (session.status == 'receiver_confirmed' && isInitiator) {
      newStatus = 'reserved';
    } else {
      newStatus = isInitiator ? 'initiator_confirmed' : 'receiver_confirmed';
    }

    await supabase
        .from('trade_sessions')
        .update({'status': newStatus})
        .eq('id', session.id);
    ref.invalidate(activeTradeSessionsProvider);
  }

  // ── Volver a editar la oferta (deshacer confirmación propia) ───────────────

  Future<void> resetMyConfirmation(TradeSession session) async {
    final myId = supabase.auth.currentUser!.id;
    final isInitiator = session.initiatorId == myId;

    if ((isInitiator && session.status == 'initiator_confirmed') ||
        (!isInitiator && session.status == 'receiver_confirmed')) {
      await supabase
          .from('trade_sessions')
          .update({'status': 'selecting'})
          .eq('id', session.id);
      ref.invalidate(activeTradeSessionsProvider);
    }
  }

  // ── Cancelar intercambio ──────────────────────────────────────────────────

  Future<void> cancelSession(String sessionId) async {
    await supabase
        .from('trade_sessions')
        .update({'status': 'cancelled'})
        .eq('id', sessionId);

    ref.invalidate(tradeHistoryProvider);
  }

  // ── Marcar cromos como entregados ─────────────────────────────────────────

  /// [deliveredOfferIds] = IDs de trade_offers que el receptor confirmó recibir
  Future<void> confirmDelivery(
    String sessionId,
    List<String> deliveredOfferIds,
    List<String> allOfferIds,
  ) async {
    // Marcar los entregados
    if (deliveredOfferIds.isNotEmpty) {
      await supabase
          .from('trade_offers')
          .update({'delivered': true})
          .inFilter('id', deliveredOfferIds);
    }

    // Completar la sesión: el receptor ya confirmó su lado.
    // No esperamos confirmación del otro lado para evitar estados colgados.
    await supabase
        .from('trade_sessions')
        .update({'status': 'completed'})
        .eq('id', sessionId);

    ref.invalidate(activeTradeSessionsProvider);
    ref.invalidate(tradeHistoryProvider);
  }

  // ── Resolver emails de los participantes ──────────────────────────────────
  // No llamamos a RPCs ni a auth.users (no accesible desde el cliente).
  // El código de intercambio sirve como identificador único visible.
  Future<TradeSession> resolveParticipantEmails(TradeSession session) async {
    return session;
  }
}

final tradeActionsProvider = AsyncNotifierProvider<TradeActionsNotifier, void>(
  TradeActionsNotifier.new,
);
