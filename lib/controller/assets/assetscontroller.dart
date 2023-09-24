import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:aplikasi_qti/models/assets/modelasset.dart';

class assetscontroller extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxList<assetResult> searchResults = <assetResult>[].obs;
  var selectedOptionlocation = ''.obs;
  var selectedOptionstatus = ''.obs;
  Map<String, String> statusMap = {
    'bd455ff3-1b85-4730-855c-5bf0018db2e5': 'Assets',
    'c8179b05-6a77-41a3-a564-089b0bc323ff': 'sold',
    'ddb92699-2f09-4c23-83dd-d0197107f757': 'stock',
  }.obs;
  List<String> selectedStatusList = ['Asset', 'Gudang', 'Stock'];

  Map<String, String> locationMap = {
    'aa104896-3f10-42cf-88d7-3a567961f8e4': 'Gudang',
    'be1a090f-9f0e-446c-b0f9-8aee486ba0be': 'Rak Penjualan',
  }.obs;
  // List<String> status = statusMap.keys.toList().obs;
  List<String> loactionlist = ['Gudang', 'Rak Penjualan'];
  List<String> statuslist = ['Asset', 'sold', "stock"];

  Future<List<assetResult?>> getallasset(String token) async {
    final Uri url = Uri.parse("http://117.54.250.99:28089/asset/");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final http.Response response = await http.get(url, headers: headers);

      print(response.body);
      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);

        if (jsonData != null && jsonData['results'] != null) {
          final List<dynamic> resultData = jsonData['results'];

          if (resultData.isEmpty) {
            return [];
          } else {
            return resultData.map((e) => assetResult.fromJson(e)).toList();
          }
        } else {
          print('Response does not contain the expected data structure');
          return [];
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<List<assetResult?>> assetsearch(String query, String token) async {
    try {
      final Uri url =
          Uri.parse("http://117.54.250.99:28089/asset/?search=$query");
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Replace with your token
      };

      final http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);

        if (jsonData != null && jsonData['results'] != null) {
          final List<dynamic> resultData = jsonData['results'];

          if (resultData.isEmpty) {
            searchResults.clear();
          } else {
            searchResults.assignAll(
                resultData.map((e) => assetResult.fromJson(e)).toList());
          }
        } else {
          print('Response does not contain the expected data structure');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return [];
  }

  void postassets(TextEditingController nama, String token) async {
    var url = Uri.parse("http://117.54.250.99:28089/asset/");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // Buat objek data dalam format JSON

    Map<String, dynamic> postData = {
      'name': nama.text,
      'location_id': selectedOptionlocation.value,
      'status_id': selectedOptionstatus.value,
    };

    var response = await http.post(
      url,
      body: jsonEncode(postData), // Konversi data ke JSON
      headers: headers,
    );
    print(" ini diaaaaaaaaaaaaaaa${response.body}");
    

    if (response.statusCode == 200) {
      // Data was successfully added
      print("Data added!");
    } else {
      // Error occurred
      print("Error adding data: ${response.statusCode}");
    }
  }

  void updateasset(TextEditingController nama, String token) async {
    var url = Uri.parse("http://117.54.250.99:28089/asset/");
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    String selectedStatusIDs =
        selectedStatusList.map((status) => statusMap[status]).join(',');
   
    Map<String, dynamic> editData = {
      'name': nama.text,
      'location_id': selectedOptionlocation.value,
      'status_id': selectedOptionstatus.value,
    };

    var response = await http.post(
      url,
      body: jsonEncode(editData), 
      headers: headers,
    );
    print(" ini diaaaaaaaaaaaaaaa${response.body}");
    Get.back();

    if (response.statusCode == 200) {
      // Data was successfully added
      print("Data added!");
    } else {
      // Error occurred
      print("Error adding data: ${response.statusCode}");
    }
  }

  Future<void> delete(String token, String id) async {
    try {
      final Uri url = Uri.parse("http://117.54.250.99:28089/asset/$id");
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 204) {
      
        Get.toNamed('/list-asset'); 
        print("Berhasil dihapus: ${response.statusCode}");
      } else {
      
        print("Gagal menghapus: ${response.statusCode}");
      
        throw Exception("Gagal menghapus: ${response.statusCode}");
      }
    } catch (error) {
    
      print("Terjadi kesalahan: $error");
     
    }
  }


  Future<void> edit(
      String token, String id, TextEditingController inputname) async {
    try {
      final Uri url = Uri.parse("http://117.54.250.99:28089/asset/${id}");
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      };
      Map<String, dynamic> editData = {
        'name': inputname.text,
        'location_id': selectedOptionlocation.value,
        'status_id': selectedOptionstatus.value,
      };
      final response =
          await http.put(url, headers: headers, body: jsonEncode(editData));

      if (response.statusCode == 204) {
      
        print("Berhasil didiedit: ${response.statusCode}");
      } else {
        print("Gagal edit: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception("Gagal edit: ${response.statusCode}");
      }
    } catch (error) {
        Get.defaultDialog(
          title: '',
          content: Image.asset('assets/images/badge.png'),
          textConfirm: 'Data has been submitted',
          buttonColor: Colors.white,
          confirmTextColor: Colors.black,
        );
      print("Terjadi kesalahan: $error");
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
