import 'package:flutter/material.dart';
import 'package:shop/home/searchitems_screen.dart';
import 'package:shop/profile/profile_screen.dart';
import '../bottomnavbar_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String selectedGender = 'NAM'; // Manage selected gender here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'TRANG CHỦ',
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'KoHo',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 25),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchItemsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black, size: 25),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 1, 0, 1),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _showGenderFilter(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedGender,
                            style: const TextStyle(
                              fontFamily: 'KoHo',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryButton(title: 'YEEZY'),
                          SizedBox(width: 10),
                          CategoryButton(title: 'ORIGINALS'),
                          SizedBox(width: 10),
                          CategoryButton(title: 'HOODIES'),
                          SizedBox(width: 10),
                          CategoryButton(title: 'OTHERS'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: const Text(
              'NEW MENSWEAR',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'KoHo',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          selectedGender == 'NAM' ? const MenswearSection() : const WomenswearSection(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  void _showGenderFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GenderFilter(
          currentGender: selectedGender,
          onGenderSelected: (gender) {
            setState(() {
              selectedGender = gender; // Update selected gender
            });
          },
        );
      },
      isScrollControlled: true,
    );
  }
}

class GenderFilter extends StatelessWidget {
  final String currentGender;
  final Function(String) onGenderSelected;

  const GenderFilter({
    Key? key,
    required this.currentGender,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24), // Space for alignment
              const Text(
                'LỌC THEO GIỚI TÍNH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              onGenderSelected('NAM'); // Update gender on selection
              Navigator.pop(context); // Close the bottom sheet
            },
            child: GenderOption(
              label: 'NAM',
              isSelected: currentGender == 'NAM',
            ),
          ),
          GestureDetector(
            onTap: () {
              onGenderSelected('NỮ'); // Update gender on selection
              Navigator.pop(context); // Close the bottom sheet
            },
            child: GenderOption(
              label: 'NỮ',
              isSelected: currentGender == 'NỮ',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            ),
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            child: const Text(
              'LƯU',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String label;
  final bool isSelected;

  const GenderOption({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[300] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  const CategoryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'KoHo',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  const ActionButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'KoHo',
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'MUA NGAY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'KoHo',
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}

class MenswearSection extends StatelessWidget {
  const MenswearSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ao_nam.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionButton(label: 'ÁO THUN TRẮNG'),
                SizedBox(height: 8),
                ActionButton(label: 'ÁO KHOÁC NAM'),
                SizedBox(height: 6),
                BuyNowButton(),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class WomenswearSection extends StatelessWidget {
  const WomenswearSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ao_nu.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionButton(label: 'ÁO NỮ TRẮNG'),
                SizedBox(height: 8),
                ActionButton(label: 'GIỚI HẠN NỮ'),
                SizedBox(height: 6),
                BuyNowButton(),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
