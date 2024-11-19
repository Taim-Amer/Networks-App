import 'package:get/get.dart';
import 'package:networks_app/features/groups/controllers/files_controller.dart';
import 'package:networks_app/features/groups/repositories/files/repo_impl.dart';

class FilesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<FilesController>(FilesController());
    Get.put<FilesRepositoryImpl>(FilesRepositoryImpl());
  }
}