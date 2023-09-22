import 'package:aplikasi_qti/Utils/Loadingpage.dart';

import 'package:aplikasi_qti/controller/assets/assetscontroller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/assets/modelasset.dart';

class assetlsb extends GetView<assetscontroller> {
  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1MzY2MzE5fQ.yL1BzgWWS4Kew0570tDlrGn-594Ny_qozdOToG7GTTg";

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => assetscontroller());
    return FutureBuilder<List>(
      future: controller.getallasset(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        Get.lazyPut(() => assetscontroller());

        return Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                width: 380,
                height: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff88C1F4))),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search_rounded),
                        border: InputBorder.none,
                        hintText: 'Search asset'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: Get.height,
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  Result? api = snapshot.data?[index];
                  return Container(
                    margin: EdgeInsets.only(top: 2),
                    height: 65,
                    width: 304,
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        "Asset Name",
                        style:
                            TextStyle(color: Color(0xff818896), fontSize: 14),
                      ),
                      subtitle: Text(
                        "${api?.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Get.toNamed('/editpage');
                          // Get.offAllNamed('/editpage');
                        },
                        child: Image.asset(
                            "assets/icons/Button Trigger Only Icon.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
