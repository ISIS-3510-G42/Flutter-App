import 'package:flutter/material.dart';
import 'views/login_page.dart';
import 'views/register_page.dart';
import 'views/home_page.dart';
import 'views/map_page.dart';
import 'app_theme.dart';
import 'views/auth_gate.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: lightTheme,        // Tema claro
      darkTheme: darkTheme,     // Tema oscuro
      themeMode: ThemeMode.system, // o ThemeMode.light / ThemeMode.dark
      home: const AuthGate(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/map': (context) => MapPage(),
      },
    );
  }
}
