import 'package:flutter/material.dart';
import 'package:shop/login/signin_screen.dart';
import 'package:shop/login/signup_screen.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/welcome.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ),
                        const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'UI/UX',
                                  style: TextStyle(fontSize: 48,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                ),
                Expanded(
                  flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150, // Đặt kích thước chiều rộng cố định
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SigninScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  side: const BorderSide(color: Colors.black, width: 2),
                                  padding: const EdgeInsets.symmetric(vertical: 15), // Đặt padding chỉ theo chiều dọc
                                  minimumSize: const Size(150, 50), // Đặt chiều dài, chiều rộng tối thiểu
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )
                                ),
                                child: Text(
                                  'Đăng Nhập'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'KoHo',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 150,
                              child:  ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  minimumSize: const Size(150, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )
                                ),
                                child: Text(
                                  'Đăng Kí'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'KoHo',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        )
    );
  }
}