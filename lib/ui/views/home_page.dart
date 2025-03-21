// home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/destacados_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  // Puedes conservar o refactorizar los métodos privados que usabas para construir los widgets (botones, categorías, etc.)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LOGO
            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 50,
              ),
            ),
            const SizedBox(height: 16),
            // BARRA DE BÚSQUEDA
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // BOTONES DE MENÚ (ejemplo)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuButton(Icons.favorite_border, 'Favoritos'),
                _buildMenuButton(Icons.history, 'Historial'),
                _buildMenuButton(Icons.chat_outlined, 'Chats'),
              ],
            ),
            const SizedBox(height: 20),
            // BANNER DESTACADO
            GestureDetector(
              onTap: () {
                // Navegación o acción al tocar el banner
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  _getBannerImageByWeather(), // función que retorna el asset adecuado
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // CATEGORÍAS (ejemplo)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Categorías',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory('Camisetas', 'assets/images/shirts'),
                  _buildCategory('Chaquetas', 'assets/images/jackets.png'),
                  _buildCategory('Pantalones', 'assets/images/pants.png'),
                  _buildCategory('Tenis', 'assets/images/tennis.png'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // PRODUCTOS DESTACADOS
            const Text(
              'Destacados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const DestacadosWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: OutlinedButton.icon(
          onPressed: () {
            // Acción o navegación
          },
          icon: Icon(icon, size: 20),
          label: Text(label, style: const TextStyle()),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: const BorderSide(),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  static Widget _buildCategory(String label, String imagePath) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  String _getBannerImageByWeather() {
    String weather = 'sunny'; // aquí podrías obtener la condición climática dinámicamente
    switch (weather) {
      case 'rain':
        return 'assets/images/banners/banner_rainy.png';
      case 'cold':
        return 'assets/images/banners/banner_winter.png';
      case 'hot':
        return 'assets/images/banners/banner_hot.png';
      default:
        return 'assets/images/banners/banner_default.png';
    }
  }
}
