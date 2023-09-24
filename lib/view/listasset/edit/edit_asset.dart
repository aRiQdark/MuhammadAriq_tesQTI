import 'package:aplikasi_qti/controller/assets/assetscontroller.dart';
import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/models/assets/modelasset.dart';
import 'package:aplikasi_qti/models/status/status.dart';
import 'package:aplikasi_qti/view/listasset/asset.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Editasset extends GetView<authcontroller> {
  const Editasset({super.key});

  @override
  Widget build(BuildContext context) {
    final assetResult index = Get.arguments;
    final Controller = Get.find<assetscontroller>();
    var token = controller.token.value;
    final inputnama = TextEditingController();
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
      body: FutureBuilder(
        future: Controller.getallasset(token),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Padding(
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
                          return DropdownMenuItem(
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
                        value: Controller.loactionlist.contains(
                                Controller.selectedOptionlocation.value)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          Get.defaultDialog(
                              title: 'Confirmation',
                              middleText:
                                  'Your action will cause this data\npermanently deleted',
                              confirm: InkWell(
                                  onTap: () {
                                    Controller.delete(token, index.id);
                                    
                                  },
                                  child: Image.asset(
                                      'assets/icons/Button - Primary(6).png')),
                              cancel: InkWell(
                                  onTap: () => Get.back(),
                                  child:
                                      Image.asset('assets/icons/cancel.png')));
                          child:
                          Image.asset("assets/icons/Button - Primary (1).png");
                        },
                        child: Image.asset("assets/icons/Button Stroke.png")),
                    InkWell(
                        onTap: () async {
                          await Controller.edit(token, index.id, inputnama);
                        },
                        child: Image.asset("assets/icons/save_update.png")),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
