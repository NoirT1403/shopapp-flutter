import 'package:flutter/material.dart';
import 'package:shop/login/verifyphone_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Xác thực Email'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    borderSide: const BorderSide(width: 3, color: Colors.black),
                  )
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerifyPhoneScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                    child: Text(
                      'Tiếp tục'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KoHo',
                        color: Colors.white,
                      ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}