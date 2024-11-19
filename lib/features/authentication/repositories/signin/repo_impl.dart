// ignore_for_file: invalid_return_type_for_catch_error
import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/signin_model.dart';
import 'package:networks_app/features/authentication/repositories/signin/repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';
import 'package:networks_app/utils/router/app_router.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class SigninRepositoryImpl implements SigninRepository {
  static SigninRepositoryImpl get instance => Get.find();

  static Rx<bool> isLogin = false.obs;

  @override
  Future<SigninModel> signin(
      {required String email, required String password}) async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .post(TApiConstants.signin, {"email": email, "password": password})
        .then((response) => SigninModel.fromJson(response))
        .catchError((error) => TLoggerHelper.error(error.toString()));
  }

  static void screenRedirect() async {
    await Future.delayed(const Duration(seconds: 2));
    await getLoginStatus();

    if (!isLogin.value) {
      Get.offNamedUntil(AppRoutes.signin, (route) => false);
    } else {
      // globalUser.currentUser = UserData.fromJson(
      //     jsonDecode(await prefService.readString('loginData')));

      // Logger.log("Navigating to bottom navigation bar");

      Get.offNamedUntil(AppRoutes.home, (route) => false);
    }
  }

  static Future<void> getLoginStatus() async {
    isLogin.value = await TCacheHelper.getData(key: "isUserLogin");
  }
}
