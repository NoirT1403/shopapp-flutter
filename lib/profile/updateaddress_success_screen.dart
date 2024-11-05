import 'package:flutter/material.dart';

class UpdateAddressSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Cập nhật địa chỉ thành công'.toUpperCase(),
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KoHo',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80),
              Icon(
                Icons.check_circle_outline_outlined,
                size: 160,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

}