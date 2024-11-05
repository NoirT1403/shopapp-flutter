import 'package:flutter/material.dart';
import 'package:shop/bottomnavbar_screen.dart';
import 'package:shop/home/ordertracking_screen.dart';
import 'package:shop/home/ordertrackingsuccess_screen.dart';
import 'package:shop/login/welcome_screen.dart';
import 'package:shop/profile/changepassword_screen.dart';
import 'package:shop/profile/profile_information_screen.dart';
import 'package:shop/profile/updateaddress_screen.dart';
import 'package:shop/profile/voucher_history_screen.dart';
import 'package:shop/profile/voucher_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 120,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phạm Huy Tấn'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 23,
                      fontFamily: 'KoHo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileInformationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Màu nền nút
                      foregroundColor: Colors.black, // Màu văn bản và icon
                      elevation: 0, // Loại bỏ đổ bóng
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit_note_outlined,
                            size: 18, color: Colors.black),
                        SizedBox(width: 5),
                        Text(
                          'Chỉnh sửa thông tin',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'KoHo',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          bottom: TabBar(
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: 'KoHo',
              color: Colors.black,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              fontFamily: 'KoHo',
            ),
            tabs: [
              Tab(text: 'Tài khoản'.toUpperCase()),
              Tab(text: 'Đơn hàng'.toUpperCase()),
              Tab(text: 'Cài đặt'.toUpperCase()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAccountTab(context),
            _buildOrdersTab(context),
            _buildSettingsTab(context),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(), // Gọi BottomNavBar ở đây
      ),
    );
  }

  Widget _buildAccountTab(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Your Points Section
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ĐIỂM CỦA BẠN',
                      style: TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 16,
                        fontFamily: 'KoHo',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '50',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KoHo',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'MỨC ĐỘ TIẾP THEO',
                      style: TextStyle(
                        color: Color(0xFF686868),
                        fontFamily: 'KoHo',
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'CẤP 2',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        fontFamily: 'KoHo',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '300 ĐIỂM',
                      style: TextStyle(
                        color: Color(0xFF686868),
                        fontFamily: 'KoHo',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // How to earn points section
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CÁCH TÍCH LŨY ĐIỂM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'KoHo',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.info_outline, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Vouchers and convert points options
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'PHIẾU GIẢM GIÁ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'KoHo',
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Xem tất cả phiếu giảm giá đã đổi',
                    style: TextStyle(
                      fontFamily: 'KoHo',
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VoucherHistoryScreen()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    'ĐỔI ĐIỂM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'KoHo',
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Đổi điểm thành phiếu giảm giá',
                    style: TextStyle(
                      fontFamily: 'KoHo',
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VoucherScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildOrderItem(
          context: context,
          orderId: "518H0552",
          orderDate: "02-05-2022 04:31:17.01",
          totalPrice: "563.000 VND",
          status: "Hoàn thành",
          destination: OrderTrackingSuccessScreen(), // Màn hình khi nhấn vào đơn hàng này
        ),
        const SizedBox(height: 16.0),
        _buildOrderItem(
          context: context,
          orderId: "519H1099",
          orderDate: "03-05-2022 08:07:01",
          totalPrice: "500.000 VND",
          status: "Đang xử lí",
          destination: OrderTrackingScreen(), // Màn hình khi nhấn vào đơn hàng này
        ),
      ],
    );
  }

  Widget _buildOrderItem({
    required BuildContext context,
    required String orderId,
    required String orderDate,
    required String totalPrice,
    required String status,
    required Widget destination, // Tham số mới để xác định màn hình đích
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'MÃ ĐƠN HÀNG: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(orderId),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Text(
                    'NGÀY ĐẶT: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(orderDate),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Text(
                    'TỔNG TIỀN: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(totalPrice),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Text(
                    'TRẠNG THÁI: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(status),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.gps_fixed, size: 32.0, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _buildListItem(
                title: 'Đổi mật khẩu',
                icon: Icons.arrow_forward,
                onTap: () {
                  // Chuyển đến màn hình Đổi mật khẩu
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()),
                  );
                },
              ),
              _buildListItem(
                title: 'Xóa tài khoản',
                icon: Icons.arrow_forward,
                onTap: () {
                  // Chuyển đến màn hình Xóa tài khoản
                },
              ),
              _buildListItem(
                title: 'Ngôn ngữ',
                icon: Icons.arrow_forward,
                onTap: () {
                  // Chuyển đến màn hình Ngôn ngữ
                },
              ),
              _buildListItem(
                title: 'Địa chỉ giao hàng',
                icon: Icons.arrow_forward,
                onTap: () {
                  // Chuyển đến màn hình Địa chỉ giao hàng
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateAddressScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => WelcomeScreen())
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Text(
              'Đăng xuất'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'KoHo',
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'KoHo',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        onTap: onTap, // Gọi hàm onTap khi nhấn vào ListTile
      ),
    );
  }
}
