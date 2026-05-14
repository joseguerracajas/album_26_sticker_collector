import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/app_shell.dart';
import 'package:album_26_sticker_collector/features/monetization/data/ads_provider.dart';
import 'package:album_26_sticker_collector/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:album_26_sticker_collector/core/widgets/custom_upgrade_alert.dart';
import 'package:upgrader/upgrader.dart';

final supabase = Supabase.instance.client;
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = 'https://phemsppmupfvwgeckfzi.supabase.co';
  const supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBoZW1zcHBtdXBmdndnZWNrZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM4OTA3MTQsImV4cCI6MjA4OTQ2NjcxNH0.M3mYbOwXXA8_59OkvAm6aNq-H_oeyPhPhIAI8jWMW6s';

  // Inicializar la conexión con tu base de datos
  // await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  await AppRepository.configure(
    supabaseUrl: supabaseUrl,
    supabaseAnonKey: supabaseAnonKey,
  );

  await AppRepository().initialize();

  // Inicializar AdMob
  await initializeAdMob();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),

        // AlertDialog (upgrader y cualquier otro diálogo de la app)
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          titleTextStyle: const TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),

        // 1. Puntero y selección de texto (Dorado)
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.amber,
          selectionColor: Colors.amber.withValues(alpha: 0.3),
          selectionHandleColor: Colors.amber,
        ),

        // 2. Bordes y Fondo del TextField (Igual a tu LoginScreen)
        inputDecorationTheme: InputDecorationTheme(
          // Activa el fondo gris oscuro
          filled: true,
          fillColor: const Color(0xFF1E1E1E),

          // Color del texto descriptivo por defecto
          labelStyle: const TextStyle(color: Colors.grey),
          // Color del texto cuando sube (animación al escribir)
          floatingLabelStyle: const TextStyle(color: Colors.amber),

          // Borde general oculto (Como lo tienes en tu código)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

          // Borde inactivo oculto
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

          // Borde Dorado brillante al tocar y escribir
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amber, width: 1.5),
          ),

          // Errores
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
          ),
        ),
      ),
      home: CustomUpgradeAlert(
        upgrader: Upgrader(durationUntilAlertAgain: const Duration(days: 1)),
        child: const AppShell(),
      ),
    );
  }
}
