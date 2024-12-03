import 'package:get/get.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find<HomeController>();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    GroupController.instance.getGroups();
    FileController.instance.getFiles();
    super.onReady();
  }
}