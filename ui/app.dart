import 'package:flutter/material.dart';
import 'views/login_page.dart';
import 'views/register_page.dart';
import 'views/home_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        primaryColor: const Color(0xFF254832), // tu verde oscuro

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF254832), // el color base
          secondary: const Color(0xFF994E12), // el color secundario
        ),
        useMaterial3: true, // puedes cambiar a false si usas Material 2
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
