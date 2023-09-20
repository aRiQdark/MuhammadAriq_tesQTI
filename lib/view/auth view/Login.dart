import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(
                    "assets/images/logo, title & body.png",
                    width: 400,
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
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none,
                          hintText: 'email'),
                    ),
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
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          border: InputBorder.none,
                          hintText: 'Password'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
                onTap: () => null,
                child: Image.asset("assets/images/Button - Primary.png"))
          ],
        ),
      ),
    );
  }
}
