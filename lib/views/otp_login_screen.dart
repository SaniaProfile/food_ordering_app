import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_app/views/home_screen.dart';

class OtpLoginScreen extends StatefulWidget {
  @override
  _OtpLoginScreenState createState() => _OtpLoginScreenState();
}

class _OtpLoginScreenState extends State<OtpLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  // Hardcoded OTP for demonstration
  final String _hardcodedOtp = '123456';

  // Function to verify OTP
  void _verifyOtp() {
    if (_otpController.text == _hardcodedOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified Successfully!')),
      );

      // Navigate to the Home screen after OTP is verified
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP!')),
      );
    }
  }


  // Function to validate phone number (10 digits)
  void _validatePhoneNumber() {
    if (_phoneController.text.length == 10) {
      setState(() {
        _isLoading = true;
      });

      // Simulate the OTP being auto-filled after 1 second
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
        _otpController.text = _hardcodedOtp; // Auto-fill OTP for demonstration
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP Sent to Your Phone!')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid 10-digit phone number!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF9E2A2F), // Maroon red color for AppBar
        title: Text(
          'Sania\'s Foodie App', // Added your name to the food app title
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light, // For better status bar color
      ),
      body: Stack(
        children: [
          // GIF Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/food_gif.gif', // Replace with your GIF file path
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Banner Section (GIF Banner)
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Welcome to Sania\'s Foodie App!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Spacer to push content to the bottom
                SizedBox(height: 30),
                // Phone Number and OTP fields Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Phone Number Input Field with black tinted transparent background
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white), // Set label text color to white
                          prefixIcon: Icon(Icons.phone, color: Colors.white), // Set icon color to white
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0x80000000), // Semi-transparent black tint
                        ),
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 18, color: Colors.white), // White text color
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                        ],
                        onChanged: (text) {
                          if (text.length == 10) {
                            // Validate phone number as soon as the user enters 10 digits
                            _validatePhoneNumber();
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      // OTP Input Field with black tinted transparent background
                      TextField(
                        controller: _otpController,
                        decoration: InputDecoration(
                          labelText: 'Enter OTP',
                          labelStyle: TextStyle(color: Colors.white), // Set label text color to white
                          prefixIcon: Icon(Icons.lock, color: Colors.white), // Set icon color to white
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0x80000000), // Semi-transparent black tint
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18, color: Colors.white), // White text color
                      ),
                      SizedBox(height: 40),
                      // Submit Button to verify OTP
                      ElevatedButton(
                        onPressed: _verifyOtp,
                        child: Text('Verify OTP'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Color(0xFF9E2A2F), // Maroon red for button
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          foregroundColor: Colors.white, // Set text color to white
                        ),
                      ),
                      SizedBox(height: 20),
                      // Already have an account? Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ", style: TextStyle(color: Colors.white)), // White text color
                          TextButton(
                            onPressed: () {
                              // Navigate to SignUp screen
                            },
                            child: Text('Sign Up', style: TextStyle(fontSize: 16, color: Color(0xFF9E2A2F))),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      _isLoading
                          ? CircularProgressIndicator()
                          : SizedBox.shrink(), // Show loading indicator when the user enters phone number
                    ],
                  ),
                ),
                // Bottom Section with your name and phrase
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Semi-transparent black background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Foodie experience by Sania', // Added a phrase about your app
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White text color
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Semi-transparent black background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Sania | Flutter Developer', // Added your name here
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white, // White text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
