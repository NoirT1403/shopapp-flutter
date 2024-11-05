import 'package:flutter/material.dart';
import 'package:shop/home/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Color? selectedColor; // Biến để lưu màu sắc đã chọn

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.black; // Mặc định chọn màu đen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/productdetail.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Giá tiền
                    Text(
                      'Giá tiền',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "500.000VNĐ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'KoHo',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: 2.0),
                    // Màu sắc
                    Text(
                      "Màu sắc",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildColorOption(Colors.black),
                            _buildDividerLine(),
                            _buildColorOption(Colors.yellow),
                            _buildDividerLine(),
                            _buildColorOption(Colors.blue),
                            _buildDividerLine(),
                            _buildColorOption(Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Các nút
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )
                          ),
                          child: Text(
                            'THÊM VÀO GIỎ HÀNG',
                            style: TextStyle(
                              fontFamily: 'KoHo',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CartScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          'MUA NGAY',
                          style: TextStyle(
                            fontFamily: 'KoHo',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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

  // Hàm xây dựng tùy chọn màu
  Widget _buildColorOption(Color color) {
    bool isSelected = color == selectedColor; // Kiểm tra nếu màu đã chọn
    return GestureDetector(
      onTap: () {
        print('Color selected: $color'); // In ra màu đã chọn
        setState(() {
          selectedColor = color; // Gán màu đã chọn
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: color,
          shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isSelected ? BorderRadius.circular(4) : null,
        ),
        width: 24,
        height: 24,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
      ),
    );
  }

  // Hàm xây dựng đường phân cách
  Widget _buildDividerLine() {
    return Container(
      width: 30.0,
      height: 1.0,
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
    );
  }
}
