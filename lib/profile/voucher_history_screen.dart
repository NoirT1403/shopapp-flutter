import 'package:flutter/material.dart';

class VoucherHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'PHIẾU GIẢM GIÁ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            fontFamily: 'KoHo',
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tổng điểm đã đổi'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'KoHo',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  '350 ĐIỂM',
                  style: TextStyle(
                    fontFamily: 'KoHo',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[300]),
          Expanded(
            child: ListView(
              children: [
                VoucherTileList(
                  icon: Icons.local_shipping,
                  title: 'miễn phí vận chuyển',
                  subtitle: '',
                ),
                Divider(height: 1, color: Colors.black),
                VoucherTileList(
                  icon: Icons.percent,
                  title: 'GIẢM GIÁ 30%',
                  subtitle: 'TỐI ĐA 500.000 VND',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VoucherTileList extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  VoucherTileList(
      {required this.icon, required this.title, this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                )
              ),
            ),
            child: Icon(icon, size: 30, color: Colors.black),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (subtitle.isEmpty) SizedBox(height: 4),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'KoHo',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
