import 'package:flutter/material.dart';
import 'package:shop/bottomnavbar_screen.dart';
import 'package:shop/home/cartaddress_screen.dart';
import 'package:shop/home/cartconfirm_screen.dart';

// ProductItem widget
class ProductItem extends StatefulWidget {
  final String image;
  final String title;
  final String material;
  final int price;
  final String size;

  const ProductItem({super.key,
    required this.image,
    required this.title,
    required this.material,
    required this.price,
    this.size = "S",
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 1;
  String selectedSize = "S";
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0XFFF3F3F3),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: Color(0XFF686868),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Chất liệu: ${widget.material}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: Color(0XFF686868),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${widget.price.toString()} VNĐ',
                      style:
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Color(0XFF505D68),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Size Dropdown
              Expanded(
                child: Container(
                  height: 30,
                  // Đặt chiều cao cụ thể
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: 1), // Viền đen độ dày 1
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  // Giảm padding ngang
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Size:'),
                      const SizedBox(width: 4),
                      // Giảm khoảng cách giữa chữ và dropdown
                      DropdownButton<String>(
                        value: selectedSize,
                        items: ['S', 'M', 'L', 'XL'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedSize = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10), // Giảm khoảng cách giữa các Row
              // Quantity Selector
              Container(
                height: 30, // Đặt chiều cao cụ thể
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 2), // Giảm khoảng cách giữa số lượng và nút
                    Center(
                      child: Text(quantity.toString()),
                    ),
                    const SizedBox(width: 2), // Giảm khoảng cách giữa số lượng và nút
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10), // Giảm khoảng cách giữa các Row
              // Color Selector
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  // Giảm padding ngang
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton<Color>(
                        value: selectedColor,
                        underline: Container(),
                        // Ẩn gạch chân của Dropdown
                        icon: const Icon(Icons.arrow_drop_down),
                        items: [
                          Colors.black,
                          Colors.red,
                          Colors.blue,
                          Colors.green
                        ].map((Color color) {
                          return DropdownMenuItem<Color>(
                            value: color,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newColor) {
                          setState(() {
                            selectedColor = newColor!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF686868),
                  ),
                  child: const FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.favorite_border_outlined,
                              color: Colors.white, size: 16),
                        ),
                        Text(
                          'THÊM VÀO MỤC YÊU THÍCH',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10), // Khoảng cách giữa hai nút
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF686868),
                  ),
                  child: const Stack(
                    alignment: Alignment.center, // Căn giữa nội dung của Stack
                    children: [
                      Align(
                        alignment: Alignment.centerLeft, // Icon sát trái
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                      Text(
                        'XOÁ',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center, // Căn giữa Text
                      ),
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
}

// CartScreen widget
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  // Sample product items for demonstration; in practice, this might come from a state management solution.
  final List<ProductItem> products = [
    const ProductItem(
      image: 'assets/images/quanthethaonu.png',
      title: 'Quần thể thao nữ',
      material: 'Cotton',
      price: 130000,
    ),
    const ProductItem(
      image: 'assets/images/quanthethaonu.png',
      title: 'Quần thể thao nam',
      material: 'Cotton',
      price: 240000,
    ),
  ];

  int get totalQuantity => products.length;

  int get totalPrice => products.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'GIỎ HÀNG',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'KoHo',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$totalQuantity SẢN PHẨM',
                  style: const TextStyle(
                    fontFamily: 'KoHo',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'TỔNG TIỀN',
                      style: TextStyle(
                        fontFamily: 'KoHo',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${totalPrice.toString()} VNĐ',
                      style: const TextStyle(
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          // Product items list
          ...products,
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartAddressScreen())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'ĐẶT HÀNG',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KoHo',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
