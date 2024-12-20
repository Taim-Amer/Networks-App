import 'package:get/get.dart';
import 'package:networks_app/common/controllers/image_picker_controller.dart';
import 'package:networks_app/features/authentication/controllers/signup_controller.dart';
import 'package:networks_app/features/authentication/repositories/signup/repo_impl.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
    Get.put<SignupRepositoryImpl>(SignupRepositoryImpl());
    Get.put<ImagePickerController>(ImagePickerController());
  }
}