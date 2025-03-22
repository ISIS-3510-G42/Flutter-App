import 'package:flutter/material.dart';

class CommonScaffold extends StatefulWidget {
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  final String? title; // Opcional para el AppBar

  const CommonScaffold({
    Key? key,
    required this.body,
    required this.currentIndex,
    required this.onItemTapped,
    this.title,
  }) : super(key: key);

  @override
  _CommonScaffoldState createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != null
          ? AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      )
          : null,
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onItemTapped,
        selectedItemColor: const Color(0xFF254832),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
