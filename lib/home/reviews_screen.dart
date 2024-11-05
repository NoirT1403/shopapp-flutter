import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('57 ĐÁNH GIÁ'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'VIẾT MỘT BÀN ĐÁNH GIÁ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Number of reviews
                itemBuilder: (context, index) {
                  return ReviewCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: index < 4 ? Colors.amber : Colors.grey,
                      size: 20.0,
                    );
                  }),
                ),
                Text(
                  '9 tháng 5 2022',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8.0),

            // Review Text
            Text(
              'ÁO KHOÁC NÀY CỰC KÌ TUYỆT VỜI, GIÁ CẢ PHẢI CHĂNG VÀ CHẤT LƯỢNG HOÀN HẢO',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'Vừa vặn với tôi, chất lượng vải tốt, rất hài lòng',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 8.0),

            // Recommendation and Username
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8.0),
                Text(
                  'ĐỀ XUẤT SẢN PHẨM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'QianJayce',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
