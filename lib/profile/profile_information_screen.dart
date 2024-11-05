import 'package:flutter/material.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  String gender = 'Nam';
  final otherGenderController = TextEditingController(); // Thêm controller cho TextFormField giới tính khác

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Thông tin cá nhân'.toUpperCase(),
          style: const TextStyle(
            fontSize: 27,
            fontFamily: 'KoHo',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Họ tên',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KoHo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Ngày sinh',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KoHo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KoHo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Số điện thoại',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KoHo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Giới tính',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KoHo',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 'Nam',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Nam',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              Radio(
                                value: 'Nữ',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Nữ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              Radio(
                                value: 'Khác',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Khác',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (gender == 'Khác')
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0), // Optional padding
                          child: TextFormField(
                            controller: otherGenderController,
                            decoration: const InputDecoration(
                              hintText: 'Vui lòng nhập giới tính khác',
                            ),
                          ),
                        ),
                      const SizedBox(height: 20), // Optional spacing
                    ],
                  ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Lưu thay đổi'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'KoHo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
