class FoodItem {
  final int id;
  final String name;
  final String price;
  final String imageUrl;

  FoodItem({required this.id, required this.name, required this.price, required this.imageUrl});

  // From JSON
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as String,
      imageUrl: json['imageUrl'] as String, // Ensure this matches your JSON structure
    );
  }
}
