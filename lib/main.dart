import 'package:album_26_sticker_collector/features/auth/presentation/auth_screen.dart';
import 'package:album_26_sticker_collector/features/catalog/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar la conexión con tu base de datos
  await Supabase.initialize(
    url: 'https://phemsppmupfvwgeckfzi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBoZW1zcHBtdXBmdndnZWNrZnppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM4OTA3MTQsImV4cCI6MjA4OTQ2NjcxNH0.M3mYbOwXXA8_59OkvAm6aNq-H_oeyPhPhIAI8jWMW6s',
  );
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

// Pantalla temporal para validar que Supabase responde
class ConnectionTestScreen extends StatefulWidget {
  const ConnectionTestScreen({super.key});

  @override
  State<ConnectionTestScreen> createState() => _ConnectionTestScreenState();
}

class _ConnectionTestScreenState extends State<ConnectionTestScreen> {
  String _status = 'Conectando a Supabase...';

  @override
  void initState() {
    super.initState();
    _testConnection();
  }

  Future<void> _testConnection() async {
    try {
      // Hacemos una consulta rápida a la tabla de categorías que creamos
      final data = await supabase.from('categories').select();
      setState(() {
        _status =
            '¡Conexión exitosa! 🎉\nCategorías encontradas: ${data.length}';
      });
    } catch (e) {
      setState(() {
        _status = 'Error de conexión: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Album 26 - Setup')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _status,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
