import 'package:flutter/material.dart';

class UpdateAddressScreen extends StatelessWidget {
  const UpdateAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {

          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Cập nhật địa chỉ'.toUpperCase(),
          style: const TextStyle(
            fontSize: 27,
            fontFamily: 'KoHo',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Số nhà, tên đường',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextFormField(),
                    const SizedBox(height: 10),
                    const Text(
                      'Phường/Xã',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextFormField(),
                    const SizedBox(height: 10),
                    const Text(
                      'Quận/Huyện',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextFormField(),
                    const SizedBox(height: 10),
                    const Text(
                      'Tỉnh/ Thành phố',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextFormField(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          // Nút cập nhật ở cuối màn hình
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý cập nhật địa chỉ ở đây
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Cập nhật'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'KoHo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}