import 'package:aplikasi_qti/controller/assets/assetscontroller.dart';
import 'package:aplikasi_qti/view/listasset/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Input extends GetView<assetscontroller> {
  final inputnama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => assetscontroller());
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => null,
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
        title: Text(
          "Input Asset",
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
              "Fill this form \nbelow",
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
                  controller: inputnama,
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
                child: Obx(
                  () => DropdownButton(
                    disabledHint: null,
                    isExpanded: true,
                    hint: const Text('Select status'),
                    value: controller.statuslist
                            .contains(controller.selectedOptionstatus.value)
                        ? controller.selectedOptionstatus.value
                        : null,
                    onChanged: (newValue) {
                      controller.selectedOptionstatus.value = newValue!;
                    },
                    items: controller.statusMap.keys.map((option) {
                      return DropdownMenuItem<String>(
                        child: Text(option),
                        value: option,
                      );
                    }).toList(),
                  ),
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
                child: Obx(
                  () => DropdownButton(
                    disabledHint: null,
                    isExpanded: true,
                    hint: const Text('Select location'),
                    value: controller.loactionlist
                            .contains(controller.selectedOptionlocation.value)
                        ? controller.selectedOptionlocation.value
                        : null,
                    onChanged: (newValue) {
                      controller.selectedOptionlocation.value = newValue!;
                    },
                    items: controller.locationMap.keys.map((option) {
                      return DropdownMenuItem<String>(
                        child: Text(option),
                        value: option,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 237,
            ),
            InkWell(
              onTap: () {
                
                controller.postassets(inputnama);
                
              },
              child: Image.asset("assets/icons/Button - Primary (2).png"))
          ],
        ),
      ),
    );
  }
}
