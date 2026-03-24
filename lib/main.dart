import 'package:album_26_sticker_collector/brick/app_repository.dart';
import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = 'https://phemsppmupfvwgeckfzi.supabase.co';
  const supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBoZW1zcHBtdXBmdndnZWNrZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM4OTA3MTQsImV4cCI6MjA4OTQ2NjcxNH0.M3mYbOwXXA8_59OkvAm6aNq-H_oeyPhPhIAI8jWMW6s';

  // Inicializar la conexión con tu base de datos
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  AppRepository.configure(
    supabaseUrl: supabaseUrl,
    supabaseAnonKey: supabaseAnonKey,
  );

  await AppRepository().initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Album 26',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF121212),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1E1E1E),
            elevation: 0,
          ),
        ),
        home: StreamBuilder<AuthState>(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, snapshot) {
            // Si el stream nos dice que hay una sesión activa, vamos al catálogo
            if (snapshot.data?.session != null) {
              return const HomeScreen();
            }
            // Si no hay sesión, mandamos al login
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
