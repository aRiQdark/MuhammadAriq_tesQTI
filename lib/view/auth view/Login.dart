import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:aplikasi_qti/widget/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Login extends GetView<authcontroller> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    var token = controller.token.value;
    Get.put(authcontroller());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    "assets/images/Login Banner top.png",
                    width: 440,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        "assets/images/only logo buenno.png",
                        width: 51,
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "You've been missed,",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text("Please sign in your account",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 44,
            ),
            Column(
              children: [
                Container(
                  width: 308,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff88C1F4))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: PrimaryTextfield(
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                                  "^[a-zA-Z0-9_.-]+@[a-zA-Z]+[.]+[a-z]")
                              .hasMatch(email)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        controller: email,
                        prefixIcon: Icon(Icons.email),
                        hintText: 'email'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18),
                  width: 308,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff88C1F4))),
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Obx(
                        () => PrimaryTextfield(
                          hintText: 'Password',
                          controller: password,
                          obscureText:
                              controller.passwordIsHidden.value == true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.passwordIsHidden.toggle();
                            },
                            icon: controller.passwordIsHidden.value == true
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
                onTap: () async {
                  controller.getToken();

                  if (email.text.isEmpty && password.text.isEmpty) {
                    Get.defaultDialog(
                        title: '', middleText: 'This form is required');
                  }
                  controller.login(email.text, password.text);
                  controller.getProfile(token);
                },
                child: Image.asset("assets/images/Button - Primary.png")),
            // ElevatedButton(
            //     onPressed: () {
            //       controller.getToken();
            //     },
            //     child: Text("get token"))
          ],
        ),
      ),
    );
  }
}
