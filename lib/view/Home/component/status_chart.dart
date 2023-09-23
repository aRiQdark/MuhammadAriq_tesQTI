// import 'package:aplikasi_qti/Utils/Loadingpage.dart';
// import 'package:aplikasi_qti/controller/Status/statuscontroller.dart';
// import 'package:aplikasi_qti/controller/auth/auth.dart';
// import 'package:aplikasi_qti/models/status/status.dart';
// import 'package:d_chart/commons/data_model.dart';
// import 'package:d_chart/ordinal/bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class chart extends GetView<authcontroller> {
//   const chart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Controller = Get.find<status>();
//     var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1NDU1NjUyfQ.0Xo4tvFti5N7b1gGQW7Oc6p-KbJCH2GpaJWEEs2vY7M";

//     print("statuss token $token");
//     return FutureBuilder(
//       future: Controller.fetchStatusData(token),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return LoadingPage();
//         }
//         if (!snapshot.hasData) {
//           return LoadingPage();
//         }

//         List<Result> api = snapshot.data;
//         int count1 = int.parse(api[0].count.toString());
//         int count2 = int.parse(api[1].count.toString());
//         int count3 = int.parse(api[2].count.toString());
//         return Container(
//           height: 350,
//           width: 380,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Chart"),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 AspectRatio(
//                   aspectRatio: 11 / 9,
//                   child: DChartBarO(
//                     groupList: [
//                       OrdinalGroup(
//                         id: '1',
//                         data: [
//                           OrdinalData(
//                               color: Color(0xff00B6AC),
//                               domain: '${api[0].status?.name}',
//                               measure: count1),
//                           OrdinalData(
//                               domain: '${api[1].status?.name}',
//                               measure: count2),
//                           OrdinalData(
//                               domain: '${api[2].status?.name}',
//                               measure: count3),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
