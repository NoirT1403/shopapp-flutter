import 'package:flutter/material.dart';
import 'package:shop/home/cart_screen.dart';

class CartSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                'Đặt hàng thành công'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KoHo',
                  color: Colors.black,// Nếu sử dụng font tùy chỉnh
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              // Subtext
              const Text(
                'Bạn có thêm 100 điểm từ đơn hàng này',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'KoHo',
                  color: Colors.black,
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
              const SizedBox(height: 110),
              // Button to return to home
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
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
                        'QUAY VỀ GIỎ HÀNG',
                        style: TextStyle(
                          fontSize: 17,
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