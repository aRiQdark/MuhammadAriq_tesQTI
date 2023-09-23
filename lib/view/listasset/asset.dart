import 'package:aplikasi_qti/Utils/Loadingpage.dart';
import 'package:aplikasi_qti/controller/assets/assetscontroller.dart';
import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/models/assets/modelasset.dart';
import 'package:aplikasi_qti/models/users.dart';
import 'package:aplikasi_qti/view/listasset/component/assetcomponen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class asset extends GetView<authcontroller> {
 
  @override
  Widget build(BuildContext context) {
Get.lazyPut(()=>assetscontroller());
    final asset = Get.find<assetscontroller>();
      var token = controller.token.value;
    final tes = TextEditingController();
    return FutureBuilder(
      future: controller.getProfile(token),
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
              physics: NeverScrollableScrollPhysics(),
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
                                CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                        "https://picsum.photos/400/400.jpg",fit: BoxFit.cover,),
                                  ),
                                ),
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
                              onTap: () => controller.logout(token),
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
                        SizedBox(height: Get.height, child: FutureBuilder<List>(
      future: asset.getallasset(token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        Get.lazyPut(() => assetscontroller());

        return ListView(
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
              height: 2000,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  assetResult? api = snapshot.data?[index];
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
    ))
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
