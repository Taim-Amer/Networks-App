import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/signup_model.dart';
import 'package:networks_app/features/authentication/repositories/signup/repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';

class SignupRepositoryImpl implements SignupRepository  {
  static SignupRepositoryImpl get instance => Get.find();

  @override
  Future<SignupModel> signup({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    // required Uint8List image,
  }) async {
    final dioHelper = TDioHelper();
    try {
      final response = await dioHelper.post(
        TApiConstants.signup,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        // imageBytes: image,
      );
      return SignupModel.fromJson(response);
    } catch (error) {
      TLoggerHelper.info(error.toString());
      rethrow;
    }
  }
}

