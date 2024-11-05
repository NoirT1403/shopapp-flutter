import 'package:flutter/material.dart';
import 'package:shop/home/payment_screen.dart';

class CartAddressScreen extends StatefulWidget {
  @override
  _CartAddressScreenState createState() => _CartAddressScreenState();
}

class _CartAddressScreenState extends State<CartAddressScreen> {
  final List<String> addresses = [
    '19 Nguyễn Hữu Thọ, Tân Hưng, Quận 7, TPHCM',
    '23A Đông Kim, Quang Trung, Thống Nhất, Đồng Nai'
  ];
  int selectedIndex = -1; // Chỉ số của địa chỉ được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            'Địa chỉ giao hàng'.toUpperCase(),
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
                return buildAddressListItem(index);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                        'Trở về',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF686868),
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

  Widget buildAddressListItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        tileColor: Color(0XFFD6D6D6).withOpacity(0.29),
        leading: Icon(Icons.location_on_outlined, color: Colors.black),
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
