import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  // Hardcoded list of orders
  final List<Map<String, String>> orders = [
    {
      'orderNumber': '12345',
      'date': '2025-02-01',
      'items': 'Pizza, Burger, Fries',
      'totalPrice': '30.00',
      'status': 'Delivered',
    },
    {
      'orderNumber': '12346',
      'date': '2025-01-25',
      'items': 'Pasta, Salad, Soft Drink',
      'totalPrice': '25.50',
      'status': 'Pending',
    },
    {
      'orderNumber': '12347',
      'date': '2025-01-20',
      'items': 'Sushi, Dumplings, Tea',
      'totalPrice': '40.00',
      'status': 'Delivered',
    },
    {
      'orderNumber': '12348',
      'date': '2025-01-18',
      'items': 'Burger, Fries, Milkshake',
      'totalPrice': '22.00',
      'status': 'Delivered',
    },
    {
      'orderNumber': '12349',
      'date': '2025-01-15',
      'items': 'Noodles, Spring Rolls, Iced Tea',
      'totalPrice': '35.00',
      'status': 'Pending',
    },
    {
      'orderNumber': '12350',
      'date': '2025-01-10',
      'items': 'Steak, Mashed Potatoes, Wine',
      'totalPrice': '60.00',
      'status': 'Delivered',
    },
    {
      'orderNumber': '12351',
      'date': '2025-01-05',
      'items': 'Tacos, Guacamole, Soda',
      'totalPrice': '18.50',
      'status': 'Pending',
    },
    {
      'orderNumber': '12352',
      'date': '2025-01-03',
      'items': 'Pasta, Garlic Bread, Wine',
      'totalPrice': '28.00',
      'status': 'Delivered',
    },
    {
      'orderNumber': '12353',
      'date': '2024-12-28',
      'items': 'Pizza, Wings, Coke',
      'totalPrice': '33.50',
      'status': 'Delivered',
    },
    {
      'orderNumber': '12354',
      'date': '2024-12-20',
      'items': 'Sushi, Tempura, Green Tea',
      'totalPrice': '45.00',
      'status': 'Pending',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Number and Date
                    Text(
                      'Order Number: ${order['orderNumber']}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Date: ${order['date']}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 10),

                    // Items in the order
                    Text(
                      'Items: ${order['items']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),

                    // Total price
                    Text(
                      'Total Price: ₹${order['totalPrice']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),

                    // Order status with color indication
                    Text(
                      'Status: ${order['status']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: order['status'] == 'Delivered'
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Button to view more details or track the order
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Implement the logic to view details for the specific order
                          },
                          child: Text('View Details'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Implement the logic to track the order if it's pending
                          },
                          child: Text('Track Order'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
