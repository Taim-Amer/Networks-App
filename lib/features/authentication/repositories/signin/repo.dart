import 'package:networks_app/features/authentication/models/signin_model.dart';

abstract class SigninRepository {
  Future<SigninModel> signin({required String email, required String password});
}
