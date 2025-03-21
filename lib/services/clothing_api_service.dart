import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/models/postModel.dart';

class ClothingApiService {
  static const String baseUrl = 'https://biol-except-ml-grid.trycloudflare.com';

  static Future<List<PostModel>> fetchClothing() async {
    final response = await http.get(Uri.parse('$baseUrl/clothing'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener la ropa: ${response.statusCode}');
    }
  }
}
