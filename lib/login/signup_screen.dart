import 'package:flutter/material.dart';
import 'package:shop/login/verifyemail_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Bọc Column trong SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Đăng ký'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: 'KoHo',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Nhập địa chỉ email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                    )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Nhập số điện thoại',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                    )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Nhập mật khẩu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                    )
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Nhập lại mật khẩu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: const BorderSide(width: 1, color: Colors.black),
                    )
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerifyEmailScreen()),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
