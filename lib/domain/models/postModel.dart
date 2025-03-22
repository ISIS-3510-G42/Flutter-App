class PostModel {
  final int id;
  final String name;
  final String brand;
  final String category;
  final String image;
  final String color;
  final String size;
  final String group;
  final String price;

  PostModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.image,
    required this.color,
    required this.size,
    required this.group,
    required this.price,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      category: map['category'] ?? '',
      image: map['image'] ?? '',
      color: map['color'] ?? '',
      size: map['size'] ?? '',
      group: map['group'] ?? '',
      price: map['price']?.toString() ?? '',
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      category: json['category'],
      image: json['image'],
      color: json['color'],
      size: json['size'],
      group: json['group'],
      price: json['price'],
    );
  }
}
