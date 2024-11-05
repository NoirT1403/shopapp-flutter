import 'package:flutter/material.dart';
import 'package:shop/home/cart_screen.dart';
import 'package:shop/home/cartaddress_screen.dart';
import 'package:shop/home/cartconfirm_screen.dart';
import 'package:shop/home/cartsuccess_screen.dart';
import 'package:shop/home/clothesitemlist_screen.dart';
import 'package:shop/home/clotheslist_screen.dart';
import 'package:shop/home/ordertracking_screen.dart';
import 'package:shop/home/ordertrackingsuccess_screen.dart';
import 'package:shop/home/payment_screen.dart';
import 'package:shop/home/productdetail_screen.dart';
import 'package:shop/home/qrcode_screen.dart';
import 'package:shop/home/reviews_screen.dart';
import 'package:shop/home/searchitems_screen.dart';
import 'package:shop/home/storefinder_information_screen.dart';
import 'package:shop/home/storefinder_screen.dart';
import 'package:shop/home/wishlist_screen.dart';
import 'package:shop/login/signin_screen.dart';
import 'package:shop/login/signup_screen.dart';
import 'package:shop/login/verifyemail_screen.dart';
import 'package:shop/login/verifyphone_screen.dart';
import 'package:shop/login/verifysuccess_screen.dart';
import 'package:shop/login/welcome_screen.dart';
import 'package:shop/profile/changepassword_screen.dart';
import 'package:shop/profile/changepassword_success_screen.dart';
import 'package:shop/profile/profile_screen.dart';
import 'package:shop/profile/profile_information_screen.dart';
import 'package:shop/profile/updateaddress_screen.dart';
import 'package:shop/profile/updateaddress_success_screen.dart';
import 'package:shop/profile/voucher_history_screen.dart';
import 'package:shop/profile/voucher_screen.dart';

import 'home/homepage_screen.dart';
import 'home/productreviews_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


