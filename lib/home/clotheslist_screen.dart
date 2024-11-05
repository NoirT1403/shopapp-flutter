import 'package:flutter/material.dart';
import 'package:shop/bottomnavbar_screen.dart';
import 'package:shop/home/clothesitemlist_screen.dart';

class ClothesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Áo khoác'.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 27,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildClothesListItem(context, 'Hoodie', 'assets/images/clotheslist1.png'),
                  buildClothesListItem(context, 'Jacket', 'assets/images/clotheslist2.png'),
                  buildClothesListItem(context, 'Bomber', 'assets/images/clotheslist1.png'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget buildClothesListItem(BuildContext context, String title, String image) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClothesItemListScreen())
            );
          },
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}