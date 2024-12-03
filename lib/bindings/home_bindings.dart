import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/authentication/controllers/signin_controller.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/repositories/file_repo_impl.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/groups/repositories/group_repo_impl.dart';
import 'package:networks_app/features/main/controllers/home_controller.dart';
import 'package:networks_app/features/main/controllers/menu_app_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuAppController>(() => MenuAppController());
    Get.lazyPut<MenuController>(() => MenuController());
    Get.put<GroupRepoImpl>(GroupRepoImpl());

    Get.put<GroupController>(GroupController());
    Get.put<HomeController>(HomeController());

    Get.put<FileController>(FileController());
    Get.put<FileRepoImpl>(FileRepoImpl());

    //for Useer Data
    Get.put<SigninController>(SigninController());
  }
}

