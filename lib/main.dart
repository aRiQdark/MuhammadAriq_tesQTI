import 'package:aplikasi_qti/Routes/app_routes.dart';
import 'package:aplikasi_qti/Routes/routename.dart';
import 'package:aplikasi_qti/view/Home/Home.dart';
import 'package:aplikasi_qti/view/auth%20view/Login.dart';
import 'package:aplikasi_qti/view/splashscreen/splashscreen.dart';
import 'package:aplikasi_qti/widget/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  bool _isUserLoggedIn() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      getPages: approutes.routes,
      initialRoute:
          _isUserLoggedIn() ? approutes.Beranda : approutes.Splashscreen,
          
    );
  }
}
