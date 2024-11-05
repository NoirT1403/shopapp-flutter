import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/bottomnavbar_screen.dart';

class StoreFinderInformationScreen extends StatelessWidget {
  const StoreFinderInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300.6), // Set height of AppBar
        child: AppBar(
          backgroundColor: const Color(0xFFDA86C3), // AppBar background color
          elevation: 0, // Remove shadow
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Define back button action here
            },
          ),
          flexibleSpace: SafeArea(
            child: Stack(
              children: [
                // Centered image at the top
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/logostore.png', // Path to logo image
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                // Align badges to bottom-left
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    // Adjust padding for bottom-left positioning
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StoreStatusBadge(status: 'CLOSED'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            DistanceBadge(distance: '2 KM'),
                            const SizedBox(width: 8),
                            LocationBadge(location: 'SU VAN HANH 11 HCM'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: StoreCardInformation(
            name: 'NEO STORE HCM, VLT HC SU VAN HANH',
            // Passing a map of days and their respective time slots
            schedule: {
              'Thứ Hai': '9:00 am - 10:00 pm',
              'Thứ Ba': '9:00 am - 10:00 pm',
              'Thứ Tư': '9:00 am - 10:00 pm',
              'Thứ Năm': '9:00 am - 10:00 pm',
              'Thứ Sáu': '9:00 am - 10:00 pm',
              'Thứ Bảy': '9:00 am - 10:00 pm',
            },
            local: 'Su Van Hanh 11\n700000, HCM\nViệt Nam',
            contact: '+84 028 2253 4558',
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// Dummy badge widgets for demonstration
class StoreStatusBadge extends StatelessWidget {
  final String status;

  StoreStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'KoHo',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DistanceBadge extends StatelessWidget {
  final String distance;

  DistanceBadge({super.key, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Text(
        distance,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'KoHo',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class LocationBadge extends StatelessWidget {
  final String location;

  LocationBadge({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Text(
        location,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'KoHo',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class StoreCardInformation extends StatelessWidget {
  final String name;
  final Map<String, String> schedule;
  final String local;
  final String contact;

  const StoreCardInformation({
    super.key,
    required this.name,
    required this.schedule,
    required this.local,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Store Name Section
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'KoHo',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          // Schedule Section for Full Week
          Text(
            'Opening Hours'.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'KoHo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: schedule.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.key, // Day (e.g., Thứ Hai)
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entry.value, // Time (e.g., 9:00 am - 10:00 pm)
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),

          // Location Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.black),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Text: 'Tìm cửa hàng ở đâu?'
                    const Text(
                      'Tìm cửa hàng ở đâu?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Optional spacing between the texts
                    // Second Text: 'local' (store location)
                    Text(
                      local,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black, width: 2), // Viền màu đen với độ dày 2 pixel
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Get Directions'.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: 'KoHo',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8), // Khoảng cách giữa text và icon
                          const Icon(Icons.arrow_forward, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Contact Section
          Row(
            children: [
              const Icon(Icons.phone_callback, color: Colors.black),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Text: 'Tìm cửa hàng ở đâu?'
                    const Text(
                      'Thắc mắc hãy gọi!',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      contact,
                      style: const TextStyle(fontSize: 16),
                    ),
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(width: 2, color: Colors.black),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Điện thoại ngay'.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: 'KoHo',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(Icons.arrow_forward, color: Colors.black)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
