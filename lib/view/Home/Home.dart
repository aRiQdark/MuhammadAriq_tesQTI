import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
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
                            CircleAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dindin Mahfud"),
                                Text("dindinmahfud@goods.com"),
                              ],
                            )
                          ],
                        ),
                        Image.asset("assets/icons/Button - Primary (1).png")
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
                    height: 20,
                  ),
                  Text(
                    "Status",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 9),
                          height: 120,
                          width: 117.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Asset \nSold",
                                  style: TextStyle(color: Color(0xff818896)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 9),
                          height: 120,
                          width: 117.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Asset in \nStock",
                                  style: TextStyle(color: Color(0xff818896)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 9),
                          height: 120,
                          width: 117.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expired \nAsset",
                                  style: TextStyle(color: Color(0xff818896)),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
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
                                    OrdinalData(color: Color(0xff00B6AC), domain: 'sold', measure: 10),
                                    OrdinalData(domain: 'Stok', measure: 3.5),
                                    OrdinalData(domain: 'Expired', measure: 4.5),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                     SizedBox(height: 16,),
            Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 16,),
            Row(
              children: [
                 Container(
                          margin: EdgeInsets.only(right: 9),
                          height: 83,
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
                                  "Gudang",
                                  style: TextStyle(color: Color(0xff818896),fontSize: 16),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "8",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                          Container(
                          margin: EdgeInsets.only(right: 9),
                          height: 83,
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
                                  "Rak Penjualan",
                                  style: TextStyle(color: Color(0xff818896),fontSize: 16),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
              ],
            ),
            SizedBox(height: 16,),
               Container(
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
                                    
                                    OrdinalData(domain: 'Gudang', measure: 8),
                                    OrdinalData(domain: 'Rak Penjualan', measure: 10),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
