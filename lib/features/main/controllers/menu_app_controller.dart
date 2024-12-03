import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MenuAppController extends GetxController {
  static MenuAppController get instance => Get.find<MenuAppController>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
