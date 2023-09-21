import 'dart:convert';

import 'package:aplikasi_qti/models/status/status.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class status extends GetxController {
  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhmMWJmZWNkLThlYTUtNGVjZi04MzBiLWFlNzk4ZjMwYjljNSIsInVzZXJuYW1lIjoiYXJpcUBxdGkudGVzdC5jb20iLCJlbWFpbCI6ImFyaXFAcXRpLnRlc3QuY29tIiwiZXhwIjoxNjk1MzEyNjc0fQ.G2iSD4Dsjb4TPSHieRrETB63oRTOYf95W8A1McCupY8";

  Future<List<Result>> fetchStatusData() async {
    final Uri url =
        Uri.parse("http://117.54.250.99:28089/home/agg-asset-by-status/");
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
            return resultData.map((e) => Result.fromJson(e)).toList();
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
}
