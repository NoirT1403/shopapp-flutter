import 'package:flutter/material.dart';
import 'package:shop/login/verifysuccess_screen.dart';

class VerifyPhoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Xác thực SĐT'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOTPInput(),
                  _buildOTPInput(),
                  _buildOTPInput(),
                  _buildOTPInput(),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => VerifySuccessScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.black, // Button background color
                ),
                child: const Text(
                  'TIẾP TỤC',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPInput() {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: "", // Hide the counter below the field
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [], // You can add input formatters if needed
      ),
    );
  }
}
