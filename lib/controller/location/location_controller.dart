import 'dart:convert';


import 'package:aplikasi_qti/models/location/locationmodel.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class locationController extends GetxController {
 
  Future<List<LocationResult>> LocationApi(String token) async {
    final Uri url =
        Uri.parse("http://117.54.250.99:28089/home/agg-asset-by-location/");
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
            return resultData.map((e) => LocationResult.fromJson(e)).toList();
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
    
      print('Error fetching data: $e');
      return [];
    }
  }
}
