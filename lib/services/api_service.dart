import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/models/food_item.dart';  // Import FoodItem model (adjust path accordingly)

class ApiService {
  // Load the mock food items from JSON file
  static Future<List<FoodItem>> fetchFoodItems() async {
    try {
      // Simulating an API call with local assets
      final String response = await rootBundle.loadString('assets/mock_data/food_items.json');
      final List<dynamic> data = json.decode(response);  // Decode JSON string into a list
      return data.map((item) => FoodItem.fromJson(item)).toList();  // Convert list of dynamic to List<FoodItem>
    } catch (e) {
      throw Exception("Failed to load food items: $e");
    }
  }

  // Load mock order items (for cart or order)
  static Future<List<dynamic>> fetchOrderItems() async {
    try {
      final String response = await rootBundle.loadString('assets/mock_data/order_items.json');
      return json.decode(response); // Parse JSON and return as List
    } catch (e) {
      throw Exception("Failed to load order items: $e");
    }
  }
}
