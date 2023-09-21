import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Login extends GetView<authcontroller> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(authcontroller());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    "assets/images/Login Banner top.png",
                    width: 440,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/logo, title & body.png",
                    width: 400,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 44,
            ),
            Column(
              children: [
                Container(
                  width: 308,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff88C1F4))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none,
                          hintText: 'email'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18),
                  width: 308,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff88C1F4))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: InputBorder.none,
                          hintText: 'Password'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
                onTap: () async {
                  Map<String, dynamic>? loginResponse =
                      await controller.login(email.text, password.text);
// controller.handleLogin(email.text,password.text);
                  String? token =
                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1MjcxMDgzfQ.Zllb65wvoRZTxd474XJ2UgCoL0D04vkomKmjhgQAFhI";

                  if (token != null) {
                    Map<String, dynamic>? profileData = await controller.getProfile(token);

                    if (profileData != null) {
                      print("berhasil");
                      print('Profil Pengguna: $profileData');
                    } else {
                      // Tangani kesalahan saat mengambil profil pengguna
                      print('Gagal mengambil data profil pengguna.');
                    }
                  } else {
                    // Tangani kesalahan jika token null
                    print('Token tidak tersedia.');
                  }
                },
                child: Image.asset("assets/images/Button - Primary.png"))
          ],
        ),
      ),
    );
  }
}
