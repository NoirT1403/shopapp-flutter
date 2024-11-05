import 'package:flutter/material.dart';
import 'package:shop/home/cartconfirm_screen.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> addresses = [
    'THANH TOÁN TRỰC TUYẾN QUA MOMO',
    'THANH TOÁN KHI NHẬN HÀNG'
  ];

  final List<String> imageAssets = [
    'assets/images/momo.png', // Đường dẫn đến hình ảnh thanh toán trực tuyến
    'assets/images/cod.png'    // Đường dẫn đến hình ảnh thanh toán khi nhận hàng
  ];

  int selectedIndex = -1; // Chỉ số của địa chỉ được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            'Phương thức thanh toán'.toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'KoHo',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return buildPaymentListItem(index);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(width: 1, color: Color(0XFF686868)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_back_sharp,
                          color: Color(0XFF686868), size: 15),
                      Text(
                        'Quay lại',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF686868),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ConfirmOrderPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tiếp theo',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_right_alt_outlined,
                          color: Colors.white, size: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentListItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        tileColor: Color(0XFFD6D6D6).withOpacity(0.29),
        leading: Image.asset(imageAssets[index], width: 24, height: 24), // Sử dụng hình ảnh làm biểu tượng
        title: Text(
          addresses[index],
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Inter',
            color: Color(0XFF222222),
            fontWeight:
            selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.black,
          value: selectedIndex == index,
          onChanged: (bool? value) {
            setState(() {
              selectedIndex = value == true
                  ? index
                  : -1; // Chỉ số mới nếu được chọn, hoặc bỏ chọn
            });
          },
        ),
      ),
    );
  }
}
