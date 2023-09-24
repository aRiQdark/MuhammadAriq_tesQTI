import 'package:aplikasi_qti/Routes/routename.dart';
import 'package:aplikasi_qti/bindings/bindingauth.dart';
import 'package:aplikasi_qti/view/Home/Home.dart';
import 'package:aplikasi_qti/view/auth%20view/Login.dart';
import 'package:aplikasi_qti/view/input/input_view.dart';
import 'package:aplikasi_qti/view/listasset/asset.dart';
import 'package:aplikasi_qti/view/listasset/edit/edit_asset.dart';
import 'package:aplikasi_qti/view/splashscreen/splashscreen.dart';
import 'package:aplikasi_qti/widget/bottomnavbar.dart';
import 'package:get/get.dart';

class approutes {
  static const Beranda = routename.Home;
  static const login = routename.login;
  static const Splashscreen = '/splashscreen';
  static final routes = [
    // GetPage(
    //   name: '/bottomnavbar',
    //   page: () {
    //     return Bottomnavbar();
    //   },
    // ),
    GetPage(
        name: '/home',
        page: () => home(),
        binding: authbinding(),
        transition: Transition.downToUp),
    GetPage(
        name: '/splashscreen',
        page: () => splashscreen(),
        binding: authbinding(),
        transition: Transition.downToUp),
    GetPage(name: routename.login, page: () => Login(), binding: authbinding()),

    GetPage(
      name: '/input',
      page: () => Input(),
    ),
    GetPage(
      name: '/list-asset',
      page: () => asset(),
    ),
    GetPage(
      name: '/editpage',
      page: () => Editasset(),
    )
  ];
}
