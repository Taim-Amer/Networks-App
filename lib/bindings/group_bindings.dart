import 'package:get/get.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/groups/repositories/group_repo_impl.dart';

class GroupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GroupRepoImpl>(GroupRepoImpl());
    Get.put<GroupController>(GroupController());
  }
}
