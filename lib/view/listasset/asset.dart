import 'package:aplikasi_qti/Utils/Loadingpage.dart';
import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/models/users.dart';
import 'package:aplikasi_qti/view/listasset/component/assetcomponen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class asset extends GetView<authcontroller> {
  
  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1Mzg5MjkxfQ.X6jjmZUe-QlKnh1RKHv31UWwqzWhU0S1O0lzLcsnnQo";

  @override
  Widget build(BuildContext context) {
    final tes = TextEditingController();
    return FutureBuilder(
      future: controller.getProfile(token!),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }
        if (!snapshot.hasData) {
          return LoadingPage();
        }
        Map<String, dynamic> userData = snapshot.data;
        Users api = Users(
          id: userData['id'],
          email: userData['email'],
          username: userData['username'],
          isActive: userData['isActive'],
          refreshedToken: '',
        );
        return SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                Container(
                  width: Get.width,
                  height: 130,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                                "assets/images/Logo-horizontal=Black 1.png"),
                            Text(
                              "TEST QTI",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${api.username}"),
                                    Text("${api.email}"),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () => controller.logout(token!),
                              child: Image.asset("assets/icons/Button - Primary (1).png"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "List Asset",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: Get.height, child: assetlsb())
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
