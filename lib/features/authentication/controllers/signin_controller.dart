import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/alerts/snackbar.dart';
import 'package:networks_app/features/authentication/models/signin_model.dart';
import 'package:networks_app/features/authentication/repositories/signin/repo_impl.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/router/app_router.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormState = GlobalKey<FormState>();

  final signinModel = SigninModel().obs;

  var signinApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signinApiStatus.value = value;
  }

  Future<void> signin() async {
    if (signInFormState.currentState!.validate()) {
      updateStatus(value: RequestState.loading);
      try {
        signinModel.value = await SigninRepositoryImpl.instance.signin(
            email: emailController.text.trim(),
            password: passwordController.text);
        if (signinModel.value.status == true) {
          updateStatus(value: RequestState.success);
          TCacheHelper.saveData(
              key: "token", value: signinModel.value.accessToken);
          TCacheHelper.saveData(
              key: "userID", value: signinModel.value.userData!.id);
          showSnackBar("Sign In Success", AlertState.success);
          Get.offAllNamed(AppRoutes.home);
        }
      } catch (error) {
        updateStatus(value: RequestState.error);
        THelperFunctions.showSnackBar(error.toString());
      }
    }
  }
}
