import 'package:aplikasi_qti/controller/auth/auth.dart';
import 'package:get/get.dart';

class authbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => authcontroller());
  }
}
