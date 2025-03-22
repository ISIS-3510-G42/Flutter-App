import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/models/postModel.dart';

class ClothingApiService {
  static const String baseUrl = 'https://that-attempted-lebanon-advert.trycloudflare.com';

  static Future<List<PostModel>> fetchClothing() async {
    final response = await http.get(Uri.parse('$baseUrl/clothing'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener la ropa: ${response.statusCode}');
    }
  }
  static Future<List<PostModel>> getByCategory(String category) async {
    final response = await http.get(Uri.parse("$baseUrl/clothing/category/$category"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => PostModel.fromMap(e)).toList();
    } else {
      throw Exception("Error al cargar ropa por categoría: ${response.statusCode}");
    }
  }
}
