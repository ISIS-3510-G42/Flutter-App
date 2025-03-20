import 'package:flutter/material.dart';
import 'views/login_page.dart';
import 'views/register_page.dart';
import 'views/home_page.dart';
import 'app_theme.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: lightTheme,        // Tema claro
      darkTheme: darkTheme,     // Tema oscuro
      themeMode: ThemeMode.system, // o ThemeMode.light / ThemeMode.dark
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
