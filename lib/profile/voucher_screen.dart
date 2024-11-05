import 'package:flutter/material.dart';

class VoucherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoucherScreenState();
}

class VoucherScreenState extends State<VoucherScreen> {
  int userPoints = 500; // Số điểm của bạn

  // Danh sách các voucher
  final List<Voucher> vouchers = [
    Voucher(icon: Icons.local_shipping, pointsRequired: 50, description: "MIỄN PHÍ VẬN CHUYỂN"),
    Voucher(icon: Icons.percent, pointsRequired: 150, description: "GIẢM GIÁ 10%", maxDiscount: 100000),
    Voucher(icon: Icons.percent, pointsRequired: 250, description: "GIẢM GIÁ 20%", maxDiscount: 300000),
    Voucher(icon: Icons.percent, pointsRequired: 300, description: "GIẢM GIÁ 30%", maxDiscount: 500000),
  ];

  void redeemVoucher(Voucher voucher) {
    if (userPoints >= voucher.pointsRequired) {
      // Đổi được voucher, trừ điểm
      setState(() {
        userPoints -= voucher.pointsRequired;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Đổi thành công"),
          content: Text("Bạn đã đổi thành công ${voucher.description}!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Không đủ điểm
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Không đủ điểm"),
          content: Text("Bạn không đủ điểm để đổi voucher này."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Đổi Điểm Lấy Voucher'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'KoHo',
            fontSize: 22,
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
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Điểm của bạn".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'KoHo',
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF686868),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "$userPoints",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'KoHo',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vouchers.length,
              itemBuilder: (context, index) {
                final voucher = vouchers[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Icon(voucher.icon, size: 30, color: Colors.black),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${voucher.pointsRequired} ĐIỂM",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'KoHo',
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              voucher.description,
                              style: TextStyle(
                                fontFamily: 'KoHo',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            if (voucher.maxDiscount != null)
                              Text(
                                "TỐI ĐA ${voucher.maxDiscount} VNĐ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'KoHo',
                                  fontWeight: FontWeight.w400,

                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => redeemVoucher(voucher),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            "ĐỔI NGAY",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'KoHo',
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Voucher {
  final IconData icon;
  final int pointsRequired;
  final String description;
  final int? maxDiscount;

  Voucher({required this.icon, required this.pointsRequired, required this.description, this.maxDiscount});
}
