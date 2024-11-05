import 'package:flutter/material.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.8))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "THANH TOÁN TRỰC TUYẾN",
                style: TextStyle(
                  fontFamily: 'KoHo',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Quét mã QR bên dưới để tiến hành thanh toán',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'KoHo',
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/qr.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
