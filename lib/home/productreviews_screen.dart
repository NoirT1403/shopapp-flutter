import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductReviewScreen extends StatefulWidget {
  @override
  _ProductReviewScreenState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  int _rating = 0;
  int _currentStep = 0; // Biến đánh dấu bước hiện tại
  final PageController _pageController = PageController();
  int _fitRating = 2; // Biến cho đánh giá độ vừa vặn
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;
  XFile? _selectedImage;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _setFitRating(int fitRating) {
    setState(() {
      _fitRating = fitRating;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) {
            return Container(
              width: MediaQuery.of(context).size.width / 20,
              height: 4,
              margin: EdgeInsets.symmetric(horizontal: 2),
              color: index == _currentStep ? Colors.grey : Colors.grey[300],
            );
          }),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentStep = index;
          });
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Step 1: Đánh giá sản phẩm bằng sao
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          // Đường dẫn ảnh sản phẩm
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn đánh giá tổng thể sản phẩm này như thế nào',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (starIndex) {
                            return IconButton(
                              icon: Icon(
                                Icons.star,
                                color: starIndex < _rating
                                    ? Colors.amber
                                    : Colors.grey,
                                size: 32,
                              ),
                              onPressed: () {
                                _setRating(starIndex + 1);
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 1) {
            // Step 2: Câu hỏi có giới thiệu sản phẩm hay không
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          // Đường dẫn ảnh sản phẩm
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn có muốn giới thiệu sản phẩm cho người khác hay không?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Text(
                            'Có',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 40),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Text(
                            'Không',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 2) {
            // Step 3: Đánh giá độ vừa vặn
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          // Đường dẫn ảnh sản phẩm
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sản phẩm có vừa với bạn hay không?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        // Hàng chứa các chấm và dấu gạch ngang
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 0
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(0);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 1
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(1);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 2
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(2);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 3
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(3);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 4
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(4);
                              },
                            ),
                          ],
                        ),
                        // Hàng chứa các nhãn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Rất chặt',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 20), // khoảng cách giữa các nhãn
                            SizedBox(width: 20),
                            Text(
                              'Hoàn hảo',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(width: 20),
                            Text(
                              'Rất rộng',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 3) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          // Đường dẫn ảnh sản phẩm
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kích cỡ sản phẩm như thế nào?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        // Hàng chứa các chấm và dấu gạch ngang
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 0
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(0);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 1
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(1);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 2
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(2);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 3
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(3);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 4
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(4);
                              },
                            ),
                          ],
                        ),
                        // Hàng chứa các nhãn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Rất ngắn',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 20), // khoảng cách giữa các nhãn
                            SizedBox(width: 20),
                            Text(
                              'Hoàn hảo',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(width: 20),
                            Text(
                              'Rất dài',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 4) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          // Đường dẫn ảnh sản phẩm
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn có cảm thấy thoải mái khi mặc không?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        // Hàng chứa các chấm và dấu gạch ngang
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 0
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(0);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 1
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(1);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 2
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(2);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 3
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(3);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 4
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(4);
                              },
                            ),
                          ],
                        ),
                        // Hàng chứa các nhãn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Không thoải mái',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(width: 20),
                            Text(
                              'Thoải mái',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 5) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          // Đường dẫn ảnh sản phẩm
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn có cảm thấy chất lượng sản phẩm thế nào?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        // Hàng chứa các chấm và dấu gạch ngang
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 0
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(0);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 1
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(1);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 2
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(2);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 3
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(3);
                              },
                            ),
                            Container(width: 20, height: 1, color: Colors.grey),
                            IconButton(
                              icon: Icon(
                                Icons.circle,
                                color: _fitRating == 4
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                _setFitRating(4);
                              },
                            ),
                          ],
                        ),
                        // Hàng chứa các nhãn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Tệ hại',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 20), // khoảng cách giữa các nhãn
                            SizedBox(width: 20),
                            Text(
                              'Tuyệt vời',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 6) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Viết đánh giá của bạn về sản phẩm trong một đoạn:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Stack(
                              children: [
                                TextField(
                                  controller: _controller,
                                  maxLines: 3,
                                  minLines: 3,
                                  maxLength: 150,
                                  decoration: InputDecoration(
                                    hintText: 'VD: Sản phẩm rất tuyệt',
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .grey), // Màu đen cho khung khi không focus
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .black), // Màu đen cho khung khi focus
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {
                                      _isButtonEnabled = text.isNotEmpty;
                                    });
                                  },
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 12,
                                  child: Text(
                                    '${_controller.text.length}/150',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _isButtonEnabled
                                  ? () {
                                      // Logic cho nút tiếp tục
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isButtonEnabled
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.25),
                                // Màu nút xám
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: Text(
                                'Tiếp tục',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 7) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Nói thêm về sản phẩm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Stack(
                              children: [
                                TextField(
                                  controller: _controller,
                                  maxLines: 3,
                                  minLines: 3,
                                  maxLength: 150,
                                  decoration: InputDecoration(
                                    hintText: 'VD: Sản phẩm.....',
                                    counterText: '',
                                    // Ẩn bộ đếm ký tự mặc định
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .grey, // Màu xám khi không focus
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Colors.black, // Màu đen khi focus
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {
                                      _isButtonEnabled = text.length >= 50;
                                    });
                                  },
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 12,
                                  child: Text(
                                    'Tối thiểu: 50 kí tự',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 12,
                                  child: Text(
                                    '${_controller.text.length}/150',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _isButtonEnabled
                                  ? () {
                                      // Logic cho nút tiếp tục
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isButtonEnabled
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: Text(
                                'Tiếp tục',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          else if (index == 8) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Thêm một bức ảnh với đánh giá của bạn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: _selectedImage == null
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate,
                              size: 50,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'ADD PHOTO',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                            : Image.file(
                          File(_selectedImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic cho nút tiếp tục
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Tiếp tục',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            );
          }else if (index == 9) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/productreview.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Nói thêm về sản phẩm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Inter',
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Stack(
                              children: [
                                TextField(
                                  controller: _controller,
                                  maxLines: 2,
                                  minLines: 2,
                                  maxLength: 25,
                                  decoration: InputDecoration(
                                    hintText: 'VD: PhucCute911',
                                    counterText: '',
                                    // Ẩn bộ đếm ký tự mặc định
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors
                                            .grey, // Màu xám khi không focus
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        Colors.black, // Màu đen khi focus
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {
                                      _isButtonEnabled = text.length >= 4;
                                    });
                                  },
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 12,
                                  child: Text(
                                    'Tối thiểu: 4 kí tự',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 12,
                                  child: Text(
                                    '${_controller.text.length}/25',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _isButtonEnabled
                                  ? () {
                                // Logic cho nút tiếp tục
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isButtonEnabled
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              child: Text(
                                'Tiếp tục',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text("Bước ${index + 1}"),
          );
        },
      ),
    );
  }
}
