import 'dart:convert';

import 'package:aplikasi_qti/Routes/routename.dart';
import 'package:aplikasi_qti/Utils/typedef.dart';
import 'package:aplikasi_qti/models/Usermodel/users.dart';
import 'package:aplikasi_qti/services/network/apiconstant.dart';
import 'package:aplikasi_qti/view/Home/Home.dart';
import 'package:aplikasi_qti/view/auth%20view/Login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class authcontroller extends GetxController {
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

    // Buat objek data yang akan dikirimkan ke server dalam bentuk JSON
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
      Get.to(home());

      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      Get.defaultDialog(middleText: 'gagal');
      return null;
    }
  }

// Future<String?> login(String email, String password) async {
//   final url = Uri.parse('http://117.54.250.99:28089/auth/login');

//   final data = {
//     "email": email,
//     "password": password,
//   };

//   final headers = {
//     'Content-Type': 'application/json',
//   };

//   final response =
//       await http.post(url, headers: headers, body: json.encode(data));

//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);
//     final token = jsonResponse['token'] as String?;
//     return token; // Mengembalikan token setelah login berhasil
//   } else {
//     Get.defaultDialog(middleText: 'gagal');
//     return null;
//   }
// }
// Future<void> handleLogin(String Email,String Password) async {
//   String? email = Email; // Ganti dengan email pengguna yang valid
//   String? password = Password; // Ganti dengan password pengguna yang valid

//   Map<String, dynamic>? token = (await login(email, password)) ;

//   if (token != null) {
//     // Jika login berhasil, lanjutkan untuk melakukan sesuatu dengan token
//     print('Berhasil login. Token: $token');
//   } else {
//     // Tangani kesalahan saat login
//     print('Gagal login.');
//   }
// }
  Future<bool> logout() async {
    final url = Uri.parse('http://117.54.250.99:28089/auth/logout');

    // Kirim permintaan POST ke URL logout
    final response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      Get.to(Login());
      return true;
    } else {
      return false;
    }
  }

 Future<String?> fetchToken(String email, String password) async {
  final url = Uri.parse('http://117.54.250.99:28089/auth/token');

  final data = {
    "username": email, 
    "password": password,
  };

  final headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(url, headers: headers, body: json.encode(data));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final token = jsonResponse['token'] as String?;
    return token;
  } else {
    // Tangani kesalahan jika permintaan tidak berhasil
    print('Gagal mendapatkan token. Status Code: ${response.statusCode}');
    print('Pesan kesalahan: ${response.body}');
    return null;
  }
}
  Future<Map<String, dynamic>?> getProfile(String token) async {
    final url = Uri.parse('http://117.54.250.99:28089/auth/me');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Menggunakan token untuk otentikasi
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
  
}
