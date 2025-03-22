import 'package:flutter/material.dart';
import '../../domain/models/postModel.dart';

class ClimateClothingPage extends StatelessWidget {
  final String clima;
  final List<PostModel> productos;

  const ClimateClothingPage({
    Key? key,
    required this.clima,
    required this.productos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ropa para $clima')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: productos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final post = productos[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(post.image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 4),
              Text(post.brand, style: const TextStyle(color: Colors.grey)),
              Text(post.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(post.price, style: const TextStyle(color: Colors.green)),
            ],
          );
        },
      ),
    );
  }
}
