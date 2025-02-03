import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: SingleChildScrollView( // Allows scrolling when overflow happens
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ensure the image has proper height
            Image.asset(
              foodItem.imageUrl,
              height: 200, // Set the image height according to your design
              width: double.infinity, // Makes sure the image takes full width
              fit: BoxFit.cover, // Ensures the image doesn't distort
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                foodItem.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("\$${foodItem.price}"),
            ),
          ],
        ),
      ),
    );
  }
}
