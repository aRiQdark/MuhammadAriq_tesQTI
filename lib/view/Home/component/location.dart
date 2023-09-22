import 'package:aplikasi_qti/Utils/Loadingpage.dart';
import 'package:aplikasi_qti/controller/Status/statuscontroller.dart';
import 'package:aplikasi_qti/controller/location/location_controller.dart';
import 'package:aplikasi_qti/models/location/locationmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class locationview extends GetView<locationController> {
  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1MzY2MzE5fQ.yL1BzgWWS4Kew0570tDlrGn-594Ny_qozdOToG7GTTg";

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => locationController());
    Get.lazyPut(() => status());
    return FutureBuilder<List<Result?>>(
      future: controller.LocationApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
            itemBuilder: (BuildContext context, int index) {
              Result? api = snapshot.data?[index];

              return Container(
                margin: EdgeInsets.only(left: 20),
                width: 159,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${api?.location?.name}",
                        style: TextStyle(color: Color(0xff818896)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${api?.count}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
