import 'package:aplikasi_qti/controller/assets/assetscontroller.dart';
import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/view/listasset/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Input extends GetView<authcontroller> {

  


  @override
  Widget build(BuildContext context) {
    Get.put(assetscontroller());
      final inputnama = TextEditingController();
    final Controller = Get.find<assetscontroller>();
    Get.put(assetscontroller());
    var token = controller.token.value;
    
    return Scaffold(
       bottomNavigationBar: Container(
              height: 80,
              width: Get.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 36, right: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          onPressed: () => Get.toNamed('/home'),
                          icon: Icon(Icons.home)),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          onPressed: () => Get.toNamed('/input'),
                          icon: Icon(Icons.add)),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          onPressed: () => Get.toNamed("/list-asset"),
                          icon: Icon(Icons.account_balance)),
                    ),
                  ],
                ),
              ),
            ),
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
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
                    value: Controller.statuslist
                            .contains(Controller.selectedOptionstatus.value)
                        ? Controller.selectedOptionstatus.value
                        : null,
                    onChanged: (newValue) {
                      Controller.selectedOptionstatus.value = newValue!;
                    },
                    items: Controller.statusMap.map((option) {
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
                    value: Controller.loactionlist
                            .contains(Controller.selectedOptionlocation.value)
                        ? Controller.selectedOptionlocation.value
                        : null,
                    onChanged: (newValue) {
                      Controller.selectedOptionlocation.value = newValue!;
                    },
                    items: Controller.locationMap.keys.map((option) {
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
                Get.put(assetscontroller());
                 Controller.postassets(inputnama,token);
                Get.defaultDialog(
                  title: '',
                  content:Image.asset('assets/images/badge.png'),
                textConfirm: 'Data has been submitted',
                buttonColor: Colors.white,
                confirmTextColor: Colors.black
               
                );
               
                
              },
              child: Image.asset("assets/icons/Button - Primary (2).png"))
          ],
        ),
      ),
    );
  }
}
