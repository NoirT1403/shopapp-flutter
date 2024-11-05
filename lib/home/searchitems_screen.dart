import 'package:flutter/material.dart';
import 'package:shop/bottomnavbar_screen.dart';
import 'package:shop/home/clotheslist_screen.dart';

class SearchItemsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchItemsScreenState();
}

class _SearchItemsScreenState extends State<SearchItemsScreen> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Tìm kiếm'.toUpperCase(),
          style: const TextStyle(
            fontSize: 27,
            fontFamily: 'KoHo',
            fontWeight: FontWeight.bold,
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
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black, width: 2),
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            height: 80, // Chiều cao của danh sách giới tính
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildListGender('Nam'),
                buildListGender('Nữ'),
                buildListGender('Trẻ Em'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // Sử dụng Expanded để chứa danh sách sản phẩm
          Expanded(
            child: ListView(
              children: [
                buildListItem('Áo khoác'),
                buildListItem('Giày dép'),
                buildListItem('Phụ kiện kèm theo'),
                buildListItem('Phụ kiện kèm theo'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget buildListGender(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SizedBox(
          width: 60,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: selectedItem == title ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListItem(String title) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black),
          onTap: () {
            Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ClothesListScreen())
            );
          },
        ),
        const Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
