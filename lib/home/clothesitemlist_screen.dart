import 'package:flutter/material.dart';
import 'package:shop/bottomnavbar_screen.dart';
import 'package:shop/home/productdetail_screen.dart';
import 'package:shop/home/searchitems_screen.dart';

class ClothesItemListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClothesItemListScreenState();
}

class ClothesItemListScreenState extends State<ClothesItemListScreen> {
  String? selectType;

  // Define a list of products
  final List<Map<String, String>> products = [
    {
      'name': 'Gaming Jacket',
      'price': '2.100.000 VNĐ',
      'imageUrl': 'assets/images/jacket1.png',
    },
    {
      'name': 'Colorblock Jacket',
      'price': '1.900.000 VNĐ',
      'imageUrl': 'assets/images/jacket2.png',
    },
    {
      'name': 'Marathon Jacket',
      'price': '500.000 VNĐ',
      'imageUrl': 'assets/images/jacket3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        title: Column(
          children: [
            const Text(
              'Jacket-NAM',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              '100 kết quả',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.57),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SearchItemsScreen()),
              );
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.filter_list, color: Colors.black, size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildFilterButton('Áo thun'),
                          buildFilterButton('Quần tây'),
                          buildFilterButton('Hoodie'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(0.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return buildProductItem(
                  product['name']!,
                  product['price']!,
                  product['imageUrl']!,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget buildFilterButton(String title) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 0), // Giảm padding bên trong nút
          minimumSize: Size(0, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(width: 1, color: Colors.black.withOpacity(0.57)),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'KoHo',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.57),
          ),
        ),
      ),
    );
  }

  Widget buildProductItem(String name, String price, String image) {
    return GestureDetector(
      onTap: () {
        // Chuyển đến màn hình chi tiết sản phẩm
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.favorite_border, color: Colors.black.withOpacity(0.5)),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'KoHo',
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                color: const Color(0xFFC4C4C4),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'KoHo',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
