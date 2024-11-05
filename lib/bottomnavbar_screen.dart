import 'package:flutter/material.dart';
import 'package:shop/home/cart_screen.dart';
import 'package:shop/home/homepage_screen.dart';
import 'package:shop/home/searchitems_screen.dart';
import 'package:shop/home/storefinder_screen.dart';
import 'package:shop/home/wishlist_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePageScreen(),
    SearchItemsScreen(),
    WishListScreen(),
    CartScreen(),
    StoreFinderScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the selected screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.whatshot),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.radar),
          label: '',
        ),
      ],
      selectedItemColor: Colors.black, // Màu cho icon được chọn
      unselectedItemColor: Colors.grey,
    );
  }
}
