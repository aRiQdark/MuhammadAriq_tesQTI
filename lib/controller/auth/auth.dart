import 'dart:convert';

import 'package:aplikasi_qti/Utils/typedef.dart';
import 'package:aplikasi_qti/services/network/apiconstant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class authcontroller extends GetxController {
 Future<Map<String, dynamic>?> login(String email, String password) async {
  final url = Uri.parse('http://117.54.250.99:28089/auth/login');

  // Buat objek data yang akan dikirimkan ke server dalam bentuk JSON
  final data = {
    "email": email,
    "password": password,
  };

  final headers = {
    'Content-Type': 'application/json', 
  };


  final response = await http.post(url, headers: headers, body: json.encode(data));
print(response.body);
  if (response.statusCode == 200) {
    // Jika permintaan berhasil, parse respons JSON
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
   Get.defaultDialog(middleText: 'gagal');
    return null;
  }
}

}
