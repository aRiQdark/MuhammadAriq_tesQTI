import 'package:aplikasi_qti/Utils/Loadingpage.dart';
import 'package:aplikasi_qti/controller/Status/statuscontroller.dart';
import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/controller/location/location_controller.dart';
import 'package:aplikasi_qti/models/Usermodel/users.dart';
import 'package:aplikasi_qti/models/location/locationmodel.dart';
import 'package:aplikasi_qti/models/users.dart';
import 'package:aplikasi_qti/view/Home/component/location.dart';
import 'package:aplikasi_qti/view/Home/component/location_chart.dart';
import 'package:aplikasi_qti/view/Home/component/status_chart.dart';
import 'package:aplikasi_qti/view/Home/component/status_view.dart';
import 'package:aplikasi_qti/view/input/input_view.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../models/status/status.dart';

class home extends GetView<authcontroller> {
  @override
  Widget build(BuildContext context) {
    var token = controller.token.value;
    Get.lazyPut(() => status());
    Get.put(locationController());
    final LocationController = Get.find<locationController>();
    final Controller = Get.find<status>();
    print(" tesssss token $token");
    Get.put(authcontroller());
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
            backgroundColor: Color(0xffF9F9F9),
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
                                CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      "https://picsum.photos/400/400.jpg",
                                      fit: BoxFit.cover,
                                    ),
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
                                onTap: () => Get.defaultDialog(
                                    title: 'Logout',
                                    middleText:
                                        'When you want to use this app,\n you have to relogin,are you sure?',
                                    confirm: InkWell(
                                        onTap: () => controller.logout(token),
                                        child: Image.asset(
                                            'assets/icons/logout-button.png')),
                                    cancel: InkWell(
                                        onTap: () => Get.back(),
                                        child: Image.asset(
                                            'assets/icons/cancel.png'))),
                                child: Image.asset(
                                    "assets/icons/Button - Primary (1).png"))
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                          child: SizedBox(
                              height: 150,
                              child: FutureBuilder<List<Result?>>(
                                future: Controller.fetchStatusData(token),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return LoadingPage();
                                  }
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }

                                  return SizedBox(
                                    height: 130,
                                    width: Get.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Result? api = snapshot.data?[index];
                                        return Container(
                                          margin: EdgeInsets.only(left: 20),
                                          width: 103.33,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${api?.status?.name}",
                                                  style: TextStyle(
                                                      color: Color(0xff818896)),
                                                ),
                                                SizedBox(
                                                  height: 80,
                                                ),
                                                Text(
                                                  "${api?.count}",
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ))),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 380,
                        child: FutureBuilder(
                          future: Controller.fetchStatusData(token),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return LoadingPage();
                            }
                            if (!snapshot.hasData) {
                              return LoadingPage();
                            }

                            List<Result> api = snapshot.data;
                            int count1 = int.parse(api[0].count.toString());
                            int count2 = int.parse(api[1].count.toString());
                            int count3 = int.parse(api[2].count.toString());
                            return Container(
                              height: 350,
                              width: 380,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Chart"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AspectRatio(
                                      aspectRatio: 11 / 9,
                                      child: DChartBarO(
                                        groupList: [
                                          OrdinalGroup(
                                            id: '1',
                                            data: [
                                              OrdinalData(
                                                  color: Color(0xff00B6AC),
                                                  domain:
                                                      '${api[0].status?.name}',
                                                  measure: count1),
                                              OrdinalData(
                                                  domain:
                                                      '${api[1].status?.name}',
                                                  measure: count2),
                                              OrdinalData(
                                                  domain:
                                                      '${api[2].status?.name}',
                                                  measure: count3),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: SizedBox(
                            height: 100,
                            child: FutureBuilder<List<LocationResult>>(
                              future: LocationController.LocationApi(token),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return LoadingPage();
                                }
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }
                                Get.lazyPut(() => locationController());
                                return SizedBox(
                                  height: 83,
                                  width: Get.width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      LocationResult? api =
                                          snapshot.data?[index];
                                      return Container(
                                        margin: EdgeInsets.only(left: 20),
                                        width: 159,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${api?.location?.name}",
                                                style: TextStyle(
                                                    color: Color(0xff818896)),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "${api?.count}",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          height: 380,
                          child: FutureBuilder<List<LocationResult>>(
                            future: LocationController.LocationApi(token),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return LoadingPage();
                              }
                              if (!snapshot.hasData) {
                                return LoadingPage();
                              }

                              List<LocationResult> api = snapshot.data;
                              int count1 = int.parse(api[0].count.toString());
                              int count2 = int.parse(api[1].count.toString());

                              return Container(
                                height: 350,
                                width: 380,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Chart"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      AspectRatio(
                                        aspectRatio: 11 / 9,
                                        child: DChartBarO(
                                          groupList: [
                                            OrdinalGroup(
                                              id: '1',
                                              data: [
                                                OrdinalData(
                                                    color: Color(0xff00B6AC),
                                                    domain:
                                                        '${api[0].location?.name}',
                                                    measure: count1),
                                                OrdinalData(
                                                    domain:
                                                        '${api[1].location?.name}',
                                                    measure: count2),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Nama ini ${api.username}");
                    },
                    child: Text("input")),
                ElevatedButton(
                    onPressed: () => Get.to(Input()), child: Text("edit")),
              ],
            ),
          ),
        );
      },
    );
  }
}
