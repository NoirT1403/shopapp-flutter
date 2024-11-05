import 'package:flutter/material.dart';

import '../home/homepage_screen.dart';

class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Text
              Text(
                'Xác thực thành công'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KoHo', // Nếu sử dụng font tùy chỉnh
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Checkmark Icon
              const Icon(
                Icons.check_circle_outline_outlined,
                size: 160,
                color: Colors.black,
              ),
              const SizedBox(height: 40),
              // Subtext
              const Text(
                'MUA SẮM NGAY THÔI NÀO',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'KoHo',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 140),
              // Button to return to home
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Nút toàn chiều rộng
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.black,
                ),
                child: const Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'ĐẾN TRANG CHỦ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KoHo',
                            color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
