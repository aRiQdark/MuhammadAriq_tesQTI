import 'package:aplikasi_qti/controller/assets/assetscontroller.dart';
import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/models/assets/modelasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Editasset extends GetView<authcontroller> {
  const Editasset({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Controller = Get.find<assetscontroller>();
    var token = controller.token.value;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
        title: Text(
          "Edit Asset",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: [
            Text(
              "Edit this form \nbelow",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Asset Nama",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 308,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xff88C1F4))),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Input name'),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 308,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xff88C1F4))),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Select status'),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 308,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xff88C1F4))),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Select location'),
                ),
              ),
            ),
            SizedBox(
              height: 237,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                   await Controller.delete(token,'e71c73a1-7316-45bc-a0aa-40f172ecfe01');
                
                print("ini coba coba $token");
                  },
                  child: Image.asset("assets/icons/Button Stroke.png")),
                Image.asset("assets/icons/save_update.png"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
