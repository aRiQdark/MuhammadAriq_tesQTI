import 'package:aplikasi_qti/view/Home/Home.dart';
import 'package:aplikasi_qti/view/input/input_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instagram_bottom_nav_bar/instagram_tab_view.dart';

class navbot extends StatelessWidget {
  const navbot({super.key});

  @override
  Widget build(BuildContext context) {
    return InstagramTabView(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.shade400,
      backgroundColor: Colors.white, // Default is Colors.white
      elevation: 12, // Default elevation is 12,
      showSelectedLabels: true, // Default showSelectedLabels is true,
      showUnselectedLabels: true, // Default showUnselectedLabels is true
      iconSize: 24, // Default iconSize is 24,
      bottomNavigationBarType: BottomNavigationBarType.fixed,
      iconType: IconType.icon,
      items: [
        InstagramTabItem(label: 'Home Page', page: home(), icon: Icon(Icons.add)),
        InstagramTabItem(label: 'Profile', page: Input(), icon: Icon(Icons.refresh)),
      ],
    )
;
  }
}