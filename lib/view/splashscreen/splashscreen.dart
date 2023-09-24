import 'package:aplikasi_qti/Routes/routename.dart';
import 'package:aplikasi_qti/view/auth%20view/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
   
    return Scaffold(
      body: Center(
         child: Image.asset("assets/images/Vertical Logo=Black 1.png"),
      ),
    );
  }
}