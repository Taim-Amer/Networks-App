import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/signup_model.dart';
import 'package:networks_app/features/authentication/repositories/signup/repo_impl.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmation = TextEditingController();

  final signupModel = SignupModel().obs;

  var signupApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signupApiStatus.value = value;
  }

  Future<void> signup() async{
    updateStatus(value: RequestState.loading);
    try {
      signupModel.value = await SignupRepositoryImpl.instance.signup(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmation.text,
          image: "image",
      );
      if(signupModel.value.status == true){
        updateStatus(value: RequestState.success);
      }
      updateStatus(value: RequestState.success);
    } catch(error){
      updateStatus(value: RequestState.error);
      THelperFunctions.showSnackBar(error.toString());
    }
  }
}