import 'package:flutter/material.dart';
import 'package:shop/bottomnavbar_screen.dart';

class StoreFinderScreen extends StatelessWidget {
  const StoreFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'tìm kiếm cửa hàng'.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'KoHo',
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.person), color: Colors.black),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Nearby you",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Expanded(
              child: ListView(
                children: const [
                  StoreCard(
                    name: 'NEO Store Ho Chi Minh',
                    time: '9:30 am - 1:30 pm',
                    address: 'Nguyen Huu Tho ST 469\n700000, Ho Chi Minh\nViet Nam',
                    distance: '2 km',
                  ),
                  StoreCard(
                    name: 'NEO Store Ho Chi Minh',
                    time: '9:30 am - 1:30 pm',
                    address: 'VLT HC Su Van Hanh\n700000, Ho Chi Minh\nViet Nam',
                    distance: '2 km',
                  ),
                  StoreCard(
                    name: 'NEO Store Ho Chi Minh',
                    time: '9:30 am - 1:30 pm',
                    address: 'Nguyen Huu Tho ST 469\n700000, Ho Chi Minh\nViet Nam',
                    distance: '2 km',
                  ),
                ]
              ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String name;
  final String time;
  final String address;
  final String distance;

  const StoreCard({super.key,
    required this.name,
    required this.time,
    required this.address,
    required this.distance,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'KoHo',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        fontFamily: 'KoHo',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      address,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        fontFamily: 'KoHo',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                const Icon(Icons.arrow_right_alt),
              ],
            ),
            TextButton(
                onPressed: (){},
                child: Text(
                  distance,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: 'KoHo',
                    color: Colors.black,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
  
}