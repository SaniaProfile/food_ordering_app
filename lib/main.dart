import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/home_screen.dart';
import 'package:food_ordering_app/views/otp_login_screen.dart';
import 'package:food_ordering_app/views/profile_screen.dart';
// Add this if you have a menu screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login', // Set the initial screen
      routes: {
        '/login': (context) => OtpLoginScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen()// Add menu screen if applicable
      },
    );
  }
}
