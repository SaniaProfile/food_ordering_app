import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define theme mode state
  bool _isDarkMode = false;

  // Define notification state
  bool _notificationsEnabled = true;

  // Language selection (just an example, could be expanded)
  String _selectedLanguage = 'English';

  // Function to toggle theme
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  // Function to toggle notifications
  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  // Function to change language
  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(), // This will toggle between light and dark themes
      home: SettingsScreen(
        onThemeToggle: _toggleTheme,
        isDarkMode: _isDarkMode,
        onNotificationToggle: _toggleNotifications,
        notificationsEnabled: _notificationsEnabled,
        onLanguageChange: _changeLanguage,
        selectedLanguage: _selectedLanguage,
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final bool notificationsEnabled;
  final String selectedLanguage;
  final Function(bool) onThemeToggle;
  final Function(bool) onNotificationToggle;
  final Function(String) onLanguageChange;

  SettingsScreen({
    required this.isDarkMode,
    required this.notificationsEnabled,
    required this.selectedLanguage,
    required this.onThemeToggle,
    required this.onNotificationToggle,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Theme Toggle (Light/Dark)
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
              subtitle: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: onThemeToggle,
              ),
            ),
            Divider(),

            // Notification Toggle
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              subtitle: Text(notificationsEnabled ? 'Enabled' : 'Disabled'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: onNotificationToggle,
              ),
            ),
            Divider(),

            // Language Selector
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text(selectedLanguage),
              onTap: () {
                // You can implement a language selection dialog or bottom sheet here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Select Language'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('English'),
                          onTap: () {
                            onLanguageChange('English');
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Spanish'),
                          onTap: () {
                            onLanguageChange('Spanish');
                            Navigator.pop(context);
                          },
                        ),
                        // Add more languages if needed
                      ],
                    ),
                  ),
                );
              },
            ),
            Divider(),

            // Other settings like Privacy, Security can go here
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy & Security'),
              onTap: () {
                // You can navigate to another screen for privacy settings
              },
            ),
            Divider(),

            // Sign Out Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign out
                },
                child: Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
