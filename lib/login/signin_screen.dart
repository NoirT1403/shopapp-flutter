import 'package:flutter/material.dart';

import '../home/homepage_screen.dart';

class SigninScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Predefined username and password
  final String predefinedUsername = "example@example.com";
  final String predefinedPassword = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Đăng nhập',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Email field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'email@example.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Đăng Nhập button
              SizedBox(
                width: double.infinity, // Make button full width
                child: ElevatedButton(
                  onPressed: () {
                    // Check if credentials match predefined values
                    if (_emailController.text == predefinedUsername &&
                        _passwordController.text == predefinedPassword) {
                      // Navigate to HomePageScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageScreen()),
                      );
                    } else {
                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tài khoản hoặc mật khẩu không đúng')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                  child: Text(
                    'Đăng Nhập'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
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
