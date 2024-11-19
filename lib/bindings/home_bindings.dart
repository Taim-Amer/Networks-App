import 'package:get/get.dart';
import 'package:networks_app/features/home/controllers/home_controller.dart';
import 'package:networks_app/features/home/repositories/home_repo_impl.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRepositoryImpl>(HomeRepositoryImpl(), permanent: true);  // Make sure it's singleton
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
