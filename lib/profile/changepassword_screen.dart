import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isObscureNewPassword = true;
  bool _isObscureConfirmPassword = true;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ĐỔI MẬT KHẨU',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'KoHo',
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mật khẩu cũ
              const Text(
                'Mật khẩu cũ',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // Mật khẩu mới
              const Text(
                'Mật khẩu mới',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: _newPasswordController,
                obscureText: _isObscureNewPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscureNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscureNewPassword = !_isObscureNewPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Nhập lại mật khẩu mới
              const Text(
                'Nhập lại mật khẩu mới',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'KoHo',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _isObscureConfirmPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscureConfirmPassword = !_isObscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Nút Đổi Mật Khẩu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý logic đổi mật khẩu ở đây
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'ĐỔI MẬT KHẨU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'KoHo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
