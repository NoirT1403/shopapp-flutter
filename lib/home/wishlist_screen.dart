import 'package:flutter/material.dart';
import '../bottomnavbar_screen.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Danh sách yêu thích'.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'KoHo',
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '2 SẢN PHẨM',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(1.0),
              children: [
                WishListCard(
                  image: 'assets/images/wishlist_1.png',
                  productName: 'QUẦN DÙ XÁM COOL',
                  size: 'XL',
                  price: '120.000 VNĐ',
                  onAddToCart: () {},
                ),
                WishListCard(
                  image: 'assets/images/wishlist_2.png',
                  productName: 'Áo thun xanh bọt biển',
                  size: 'M',
                  price: '720.000 VNĐ',
                  onAddToCart: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class WishListCard extends StatelessWidget {
  final String image;
  final String productName;
  final String size;
  final String price;
  final VoidCallback onAddToCart;

  WishListCard({
    required this.image,
    required this.productName,
    required this.size,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0XFFF1F1F1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF505D68),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      productName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      'Size $size',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAddToCart,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFFF1F1F1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'THÊM VÀO GIỎ HÀNG',
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'KoHo',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.height * 0.02),
                          // Add spacing between text and icon
                          const Icon(Icons.add_shopping_cart,
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
