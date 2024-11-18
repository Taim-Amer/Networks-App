import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/signup_model.dart';
import 'package:networks_app/features/authentication/repositories/signup/repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';

class SignupRepositoryImpl implements SignupRepository  {
  static SignupRepositoryImpl get instance => Get.find();

  @override
  Future<SignupModel> signup({required String name, required String email, required String password, required String passwordConfirmation, required String image}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.signup,{
      'name' : name,
      'email' : email,
      'password' : password,
      'password_confirmation' : passwordConfirmation,
      'image' : image,
    }).then((response) => SignupModel.fromJson(response)).catchError((error) => TLoggerHelper.info(error.toString()));
  }
}

