import 'package:aplikasi_qti/services/network/apiconstant.dart';
import 'package:aplikasi_qti/services/network/interceptors/request_interceptors.dart';
import 'package:aplikasi_qti/services/network/interceptors/response_interceptors.dart';
import 'package:get/get.dart';


class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Apiconstant.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.timeout = const Duration(seconds: 35);
  }
}
