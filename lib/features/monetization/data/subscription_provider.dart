import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ─── Constantes ────────────────────────────────────────────────────────────────
const _kScansDemoKey = 'demo_scans_used';
const kDemoScanLimit = 5;
const kScannerEntitlement = 'Album_26_Pro';
const kRevenueCatAppleKey = 'appl_RFbaohRODHeXtaMhoUYOZiKIEBV';
const kRevenueCatGoogleKey = 'test_kXKxubqbGjyIEWIJIPPuqfnxqZo';

// ─── Estado ───────────────────────────────────────────────────────────────────
class SubscriptionState {
  final bool isSubscribed;
  final int demoScansUsed;
  final bool isLoading;

  const SubscriptionState({
    this.isSubscribed = false,
    this.demoScansUsed = 0,
    this.isLoading = true,
  });

  bool get canScan => isSubscribed || demoScansUsed < kDemoScanLimit;
  int get demoScansRemaining =>
      (kDemoScanLimit - demoScansUsed).clamp(0, kDemoScanLimit);

  SubscriptionState copyWith({
    bool? isSubscribed,
    int? demoScansUsed,
    bool? isLoading,
  }) => SubscriptionState(
    isSubscribed: isSubscribed ?? this.isSubscribed,
    demoScansUsed: demoScansUsed ?? this.demoScansUsed,
    isLoading: isLoading ?? this.isLoading,
  );
}

// ─── Notifier ─────────────────────────────────────────────────────────────────
class SubscriptionNotifier extends AsyncNotifier<SubscriptionState> {
  @override
  Future<SubscriptionState> build() async {
    await _configureRevenueCat();
    return _loadState();
  }

  Future<void> _configureRevenueCat() async {
    try {
      await Purchases.setLogLevel(LogLevel.debug);
      final config = PurchasesConfiguration(
        defaultTargetPlatform == TargetPlatform.iOS
            ? kRevenueCatAppleKey
            : kRevenueCatGoogleKey,
      );
      await Purchases.configure(config);

      // Vincular con la cuenta del usuario si ya hay sesión activa
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId != null) {
        await Purchases.logIn(userId);
      }
    } catch (e) {
      debugPrint('❌ RevenueCat configure error: $e');
    }
  }

  Future<SubscriptionState> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final demoUsed = prefs.getInt(_kScansDemoKey) ?? 0;
    bool subscribed = false;

    try {
      final info = await Purchases.getCustomerInfo();
      subscribed = info.entitlements.active.containsKey(kScannerEntitlement);
    } catch (e) {
      debugPrint('❌ RevenueCat getCustomerInfo error: $e');
    }

    return SubscriptionState(
      isSubscribed: subscribed,
      demoScansUsed: demoUsed,
      isLoading: false,
    );
  }

  /// Llámalo tras un login exitoso en Supabase para vincular la suscripción
  Future<void> loginUser(String userId) async {
    try {
      await Purchases.logIn(userId);
      // Recargar el estado tras el login para reflejar posibles suscripciones
      state = const AsyncValue.loading();
      state = AsyncValue.data(await _loadState());
    } catch (e) {
      debugPrint('❌ RevenueCat logIn error: $e');
    }
  }

  /// Llámalo al cerrar sesión en Supabase
  Future<void> logoutUser() async {
    try {
      await Purchases.logOut();
      // Volver al estado anónimo (sin suscripción, demos reseteados)
      state = AsyncValue.data(await _loadState());
    } catch (e) {
      debugPrint('❌ RevenueCat logOut error: $e');
    }
  }

  /// Llámalo cuando el scanner detecta 1 cromo (solo para usuarios free)
  Future<void> consumeDemoScan() async {
    final current = state.asData?.value;
    if (current == null || current.isSubscribed) return;

    final prefs = await SharedPreferences.getInstance();
    final newCount = (current.demoScansUsed + 1).clamp(0, kDemoScanLimit);
    await prefs.setInt(_kScansDemoKey, newCount);

    state = AsyncValue.data(current.copyWith(demoScansUsed: newCount));
  }

  /// Abre la pantalla de compra y actualiza el estado si el usuario suscribe.
  /// Lanza una excepción si el error no fue cancelación por el usuario.
  Future<bool> purchase(Package package) async {
    try {
      final result = await Purchases.purchasePackage(package);
      final subscribed = result.entitlements.active.containsKey(
        kScannerEntitlement,
      );

      if (subscribed) {
        final current = state.asData?.value ?? const SubscriptionState();
        state = AsyncValue.data(current.copyWith(isSubscribed: true));
      }
      return subscribed;
    } catch (e) {
      // PurchasesError.code == purchaseCancelledError → el usuario canceló,
      // no mostramos error. Cualquier otro error lo propagamos al caller.
      final cancelled =
          e.toString().toLowerCase().contains('cancelled') ||
          e.toString().toLowerCase().contains('canceled');
      if (!cancelled) {
        debugPrint('❌ Purchase error: $e');
        rethrow;
      }
      return false;
    }
  }

  /// Restaurar compras (requerido por App Store guidelines)
  Future<void> restorePurchases() async {
    try {
      final info = await Purchases.restorePurchases();
      final subscribed = info.entitlements.active.containsKey(
        kScannerEntitlement,
      );

      final current = state.asData?.value ?? const SubscriptionState();
      state = AsyncValue.data(current.copyWith(isSubscribed: subscribed));
    } catch (e) {
      debugPrint('❌ Restore error: $e');
      throw 'Error al restaurar compras. Intenta de nuevo más tarde.';
    }
  }
}

final subscriptionProvider =
    AsyncNotifierProvider<SubscriptionNotifier, SubscriptionState>(
      SubscriptionNotifier.new,
    );

// Provider conveniente para saber si puede escanear (sin AsyncValue)
final canScanProvider = Provider<bool>((ref) {
  return ref.watch(subscriptionProvider).asData?.value.canScan ?? false;
});

final isSubscribedProvider = Provider<bool>((ref) {
  return ref.watch(subscriptionProvider).asData?.value.isSubscribed ?? false;
});
