import 'package:flutter/material.dart';
import 'package:shop/home/cartaddress_screen.dart';
import 'package:shop/home/cartsuccess_screen.dart';
import 'package:shop/home/qrcode_screen.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  double productPrice = 100000;
  double shippingFee = 30000;
  double discount = 0;
  double? totalPrice;
  String selectedPromoCode = 'Chọn mã khuyến mãi';
  String selectedPaymentMethod = 'Thanh toán khi nhận hàng';

  @override
  void initState() {
    super.initState();
    totalPrice = productPrice + shippingFee - discount;
  }

  void applyDiscount(String promoCode) {
    setState(() {
      if (promoCode == 'DISCOUNT10') {
        discount = 10000; // Giảm 10.000 VND
      } else {
        discount = 0;
      }
      totalPrice = productPrice + shippingFee - discount;
      selectedPromoCode = promoCode;
    });
  }

  void showPromoCodeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.all(16),
          children: [
            ListTile(
              title: Text('DISCOUNT10 - Giảm 10.000 VND'),
              onTap: () {
                applyDiscount('DISCOUNT10');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('NO_PROMO - Không có giảm giá'),
              onTap: () {
                applyDiscount('NO_PROMO');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'XÁC NHẬN ĐƠN HÀNG',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'KoHo',
                      color: Colors.black,
                    ),
                  ),
                  // Phần Vận Chuyển
                  SizedBox(height: 8),
                  Text(
                    'VẬN CHUYỂN',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Icon(Icons.local_shipping),
                      SizedBox(width: 8),
                      Text('GHTK delivery'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text('19 Nguyễn Hữu Thọ, Tân Hưng, Quận 7, TPHCM'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Phần Sản Phẩm
                  Text(
                    'SẢN PHẨM',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(height: 30, thickness: 1),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/cartconfirm.png',
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quần thể thao vải cotton',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF222222),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Size: S • Màu sắc: Đen • Số lượng: 1',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '100.000 VND',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(height: 20, thickness: 1),
                  // Nút chọn mã khuyến mãi
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.2, 2, 10, 5),
                        child: Row(
                          children: [
                            Icon(Icons.card_giftcard),
                            SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                height: 20.0,
                                child: ElevatedButton(
                                  onPressed: showPromoCodeDialog,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(vertical: 2.0),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      selectedPromoCode,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tổng Cộng
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.3, 2, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TỔNG CỘNG',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  '${productPrice.toStringAsFixed(0)} VNĐ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF222222),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PHÍ VẬN CHUYỂN',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  '${shippingFee.toStringAsFixed(0)} VNĐ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF222222),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'GIẢM GIÁ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  '-${discount.toStringAsFixed(0)} VNĐ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF222222),
                                  ),
                                ),
                              ],
                            ),
                            Divider(height: 5),
                            // Phải Thanh Toán
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PHẢI THANH TOÁN',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  '${(totalPrice ?? 0).toStringAsFixed(0)} VNĐ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF222222),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'PHƯƠNG THỨC THANH TOÁN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedPaymentMethod,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPaymentMethod = newValue!;
                      });
                    },
                    items: <String>[
                      'Thanh toán khi nhận hàng',
                      'Thanh toán trực tuyến',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          // Nút Xác Nhận Thanh Toán
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  if(selectedPaymentMethod == 'Thanh toán trực tuyến') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QRCodeScreen())
                    );
                  }else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartSuccessScreen())
                    );
                  }
                },
                child: Text(
                  'XÁC NHẬN THANH TOÁN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
