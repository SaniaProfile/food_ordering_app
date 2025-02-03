import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  // Hardcoded list of orders to simulate the tracking process
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
    // Add more orders here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
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

                    // Track Progress Indicator
                    if (order['status'] == 'Pending') ...[
                      Text(
                        'Tracking Progress:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 0.5, // 50% progress, adjust accordingly
                        backgroundColor: Colors.grey[200],
                        color: Colors.orange,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Your order is being prepared.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ] else ...[
                      Text(
                        'Tracking Progress:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 1.0, // 100% progress for delivered orders
                        backgroundColor: Colors.grey[200],
                        color: Colors.green,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Your order has been delivered!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],

                    SizedBox(height: 20),

                    // Button to go back to profile screen
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Go back to ProfileScreen
                        },
                        child: Text('Back to Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
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
