import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de navegación inferior (opcional)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Home está seleccionado
        onTap: (index) {
          // Manejar cambio de pestaña
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Descubrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Para que la pantalla sea desplazable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra de búsqueda
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Buscar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),

              // Menú superior (Favoritos, Historial, Chats)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem(Icons.favorite, 'Favoritos'),
                    _buildMenuItem(Icons.history, 'Historial'),
                    _buildMenuItem(Icons.chat, 'Chats'),
                  ],
                ),
              ),

              // Sección de Banner (ejemplo)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1562158077-ff45d82e66f8',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Título de Categorías
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Categorías',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Lista horizontal de categorías
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    _buildCategoryItem('Camisetas', Icons.shop),
                    _buildCategoryItem('Chaquetas', Icons.ac_unit),
                    _buildCategoryItem('Pantalones', Icons.work),
                    _buildCategoryItem('Tenis', Icons.run_circle),
                    // Agrega más categorías...
                  ],
                ),
              ),

              // Sección de Productos Destacados
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Destacados',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Grid de productos destacados
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4, // Ejemplo: 4 productos
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columnas
                    childAspectRatio: 0.7, // Ajustar la proporción
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return _buildProductItem(
                      'Camiseta Cristiano',
                      'Nike',
                      'assets/images/cr7.jpg',
                      '\$120.990',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para item del menú superior
  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  // Widget para item de categoría
  Widget _buildCategoryItem(String label, IconData icon) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            child: Icon(icon),
          ),
          SizedBox(height: 4),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Widget para producto destacado
  Widget _buildProductItem(String title, String brand, String imagePath, String price) {
    return GestureDetector(
      onTap: () {
        // Navegar a detalle del producto
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            // Imagen del producto
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: AssetImage(imagePath), // o NetworkImage
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Información del producto
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(brand),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
