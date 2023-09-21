import 'package:aplikasi_qti/Utils/Loadingpage.dart';
import 'package:aplikasi_qti/controller/Status/statuscontroller.dart';
import 'package:aplikasi_qti/models/status/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class status_view extends GetView<status> {
  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1MjcxMDgzfQ.Zllb65wvoRZTxd474XJ2UgCoL0D04vkomKmjhgQAFhI";

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => status());
    return FutureBuilder<List<Result?>>(
      future: controller.fetchStatusData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
            itemBuilder: (BuildContext context, int index) {
              Result? api = snapshot.data?[index];
              return Container(
                margin: EdgeInsets.only(left: 20),
                width: 103.33,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${api?.status?.name}",
                        style: TextStyle(color: Color(0xff818896)),
                      ),
                      SizedBox(
                        height: 80,
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
