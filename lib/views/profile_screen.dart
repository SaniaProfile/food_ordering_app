import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/cart_screen.dart';
import 'package:food_ordering_app/views/order_detail.dart';
import 'package:food_ordering_app/views/setting.dart';
import 'package:food_ordering_app/views/track_order.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/images/default_avatar.jpg') as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.blue),
                        onPressed: _pickImage,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Order History with navigation
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Order History'),
                onTap: () {
                  // Navigate to order history screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderHistoryScreen(),
                    ),
                  );
                },
              ),
              Divider(),

              // Track Order
              ListTile(
                leading: Icon(Icons.delivery_dining),
                title: Text('Track Orders'),
                onTap: () {
                  // Use Navigator.push to navigate to the TrackOrderScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackOrderScreen(),
                    ),
                  );
                },
              ),
              Divider(),

              // Cart
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('My Cart'),
                onTap: () {
                  // Navigate to the Cart Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              ),
              Divider(),

              // Settings
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Navigate to Settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(
                        isDarkMode: _isDarkMode,
                        notificationsEnabled: _notificationsEnabled,
                        selectedLanguage: _selectedLanguage,
                        onThemeToggle: _toggleTheme,
                        onNotificationToggle: _toggleNotifications,
                        onLanguageChange: _changeLanguage,
                      ),
                    ),
                  );
                },
              ),
              Divider(),

              // Logout
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement logout functionality
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
