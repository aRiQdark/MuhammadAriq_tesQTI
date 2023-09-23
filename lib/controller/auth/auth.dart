import 'dart:convert';

import 'package:aplikasi_qti/Routes/app_routes.dart';
import 'package:aplikasi_qti/Routes/routename.dart';
import 'package:aplikasi_qti/Utils/typedef.dart';
import 'package:aplikasi_qti/models/Usermodel/users.dart';
import 'package:aplikasi_qti/services/network/apiconstant.dart';
import 'package:aplikasi_qti/view/Home/Home.dart';
import 'package:aplikasi_qti/view/auth%20view/Login.dart';
import 'package:aplikasi_qti/view/listasset/asset.dart';
import 'package:aplikasi_qti/widget/bottomnav1.dart';
import 'package:aplikasi_qti/widget/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class authcontroller extends GetxController {
  RxBool passwordIsHidden = true.obs;
  var token = ''.obs;
final find = TextEditingController();
  void setToken(String newToken) {
    token.value = newToken;
  }

  Future<void> getToken() async {
    var url = Uri.parse("http://117.54.250.99:28089/auth/token");
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, String> requestBody = {
      'grant_type': 'password',
      'username': 'Muhammad Ariq',
      'password': 'ariq50470',
      'scope': '',
      'client_id': '',
      'client_secret': '',
    };

    var response = await http.post(
      url,
      body: Uri.encodeFull(Uri(queryParameters: requestBody).query),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var token = responseData['access_token'];
      print("Token: $token");
      setToken(token);
      print(response.body);
    } else {
      print("Error: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  }

  Future<Stream<Map<String, dynamic>?>?> data() async {
    final url = Uri.parse('http://117.54.250.99:28089');

    // Buat objek data yang akan dikirimkan ke server dalam bentuk JSON

    final headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(url, headers: headers, body: json.encode(data));
    print(response.body);
    if (response.statusCode == 200) {
      Get.to(home());
      // Jika permintaan berhasil, parse respons JSON
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      Get.defaultDialog(middleText: 'gagal');
      return null;
    }
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final url = Uri.parse('http://117.54.250.99:28089/auth/login');

   
    final data = {
      "email": email,
      "password": password,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(url, headers: headers, body: json.encode(data));
    print(response.body);
    if (response.statusCode == 200) {
      Get.toNamed('/bottomnavbar');
Get.to(Bottomnavbar());
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      Get.defaultDialog(middleText: 'gagal');
      return null;
    }
  }

  Future<bool> logout(String token) async {
    final url = Uri.parse('http://117.54.250.99:28089/auth/logout');
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      Get.offAllNamed(routename.login);
      print("berhasil log out ${response.body}");
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>?> getProfile(String token) async {
    final url = Uri.parse('http://117.54.250.99:28089/auth/me');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      // Tangani kesalahan jika permintaan tidak berhasil
      return null;
    }
  }
   @override
  void dispose() {
    find.dispose();
    super.dispose();
  }
}
