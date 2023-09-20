import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class asset extends StatelessWidget {
  const asset({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Image.asset("assets/images/Logo-horizontal=Black 1.png"),
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
                    Text(
                      "List Asset",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
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
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(top: 2),
                            height: 65,
                            width: 304,
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                "Asset Name",
                                style: TextStyle(
                                    color: Color(0xff818896), fontSize: 14),
                              ),
                              subtitle: Text(
                                "Susu Bendera",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              trailing: Image.asset("assets/icons/Button Trigger Only Icon.png"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
