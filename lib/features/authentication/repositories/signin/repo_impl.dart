// ignore_for_file: invalid_return_type_for_catch_error
import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/signin_model.dart';
import 'package:networks_app/features/authentication/repositories/signin/repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';

class SigninRepositoryImpl implements SigninRepository {
  static SigninRepositoryImpl get instance => Get.find();

  static Rx<bool> isLogin = false.obs;

  @override
  Future<SigninModel> signin(
      {required String email, required String password}) async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .post(TApiConstants.signin, data: {"email": email, "password": password})
        .then((response) => SigninModel.fromJson(response));
  }
}
