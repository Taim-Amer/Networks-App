import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/signin_model.dart';
import 'package:networks_app/features/authentication/repositories/signin/repo_impl.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class SigninController extends GetxController{
  static SigninController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signinModel = SigninModel().obs;

  var signinApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signinApiStatus.value = value;
  }


  Future<void> signin() async{
    updateStatus(value: RequestState.loading);
    try {
      signinModel.value = await SigninRepositoryImpl.instance.signin(email: emailController.text.trim(), password: passwordController.text);
      if(signinModel.value.status == true){
        updateStatus(value: RequestState.success);
      }
      updateStatus(value: RequestState.success);
    } catch(error){
      updateStatus(value: RequestState.error);
      THelperFunctions.showSnackBar(error.toString());
    }
  }
}