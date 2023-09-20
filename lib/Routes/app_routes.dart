import 'package:aplikasi_qti/Routes/routename.dart';
import 'package:aplikasi_qti/bindings/bindingauth.dart';
import 'package:aplikasi_qti/view/Home/Home.dart';
import 'package:aplikasi_qti/view/auth%20view/Login.dart';
import 'package:get/get.dart';

class approutes {
  static const Beranda = routename.Home;

  static final routes = [
    GetPage(
        name: routename.Home,
        page: () => home(),
        binding: authbinding(),
        transition: Transition.downToUp),
    GetPage(name: '/auth', page: () => Login(), binding: authbinding())
  ];
}
