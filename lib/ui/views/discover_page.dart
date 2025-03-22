// discover_page.dart
import 'package:flutter/material.dart';
import '../../domain/models/postModel.dart';
import '../../services/clothing_api_service.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<PostModel> allItems = [];
  List<PostModel> filteredItems = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    final items = await ClothingApiService.fetchClothing();
    setState(() {
      allItems = items;
      filteredItems = items;
    });
  }

  void filterItems(String query) {
    final results = allItems.where((item) =>
    item.name.toLowerCase().contains(query.toLowerCase()) ||
        item.brand.toLowerCase().contains(query.toLowerCase()) ||
        item.category.toLowerCase().contains(query.toLowerCase())
    ).toList();

    setState(() {
      searchText = query;
      filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubrir'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Implementar filtros locales si se desea
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                onChanged: filterItems,
                decoration: const InputDecoration(
                  hintText: 'Buscar',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(item.image, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(item.brand, style: const TextStyle(color: Colors.grey)),
                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.price, style: const TextStyle(color: Colors.green)),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
