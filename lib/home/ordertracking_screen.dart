import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THEO DÕI ĐƠN HÀNG', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('MÃ ĐƠN HÀNG: 519H0199'),
            Text('NGÀY ĐẶT: 03-05-2022 08:07:01'),
            Text('TỔNG TIỀN: 500.000 VNĐ'),
            Text('PHƯƠNG THỨC THANH TOÁN: Đã thanh toán trực tuyến'),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildTimelineTile(
                    isFirst: true,
                    isLast: false,
                    status: 'Giao hàng thành công',
                    time: 'Đang chờ',
                    isCompleted: false,
                  ),
                  _buildTimelineTile(
                    isFirst: false,
                    isLast: false,
                    status: 'Bưu tá đang giao hàng',
                    isCompleted: true,
                  ),
                  _buildTimelineTile(
                    isFirst: false,
                    isLast: false,
                    status: 'Đã đến kho Đồng Nai',
                    isCompleted: true,
                  ),
                  _buildTimelineTile(
                    isFirst: false,
                    isLast: false,
                    status: 'Đã giao hàng cho đơn vị vận chuyển',
                    isCompleted: true,
                  ),
                  _buildTimelineTile(
                    isFirst: false,
                    isLast: true,
                    status: 'Đang chuẩn bị hàng',
                    isCompleted: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTile({required bool isFirst, required bool isLast, required String status, String? time, required bool isCompleted}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
            Icon(
              Icons.circle,
              size: 12,
              color: isCompleted ? Colors.black : Colors.grey,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
          ],
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: isCompleted ? Colors.black : Colors.grey),
            ),
            if (time != null)
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
