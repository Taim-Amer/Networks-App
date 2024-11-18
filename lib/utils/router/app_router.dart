import 'package:get/get.dart';
import 'package:networks_app/bindings/files_binding.dart';
import 'package:networks_app/bindings/signin_binding.dart';
import 'package:networks_app/bindings/signup_binding.dart';
import 'package:networks_app/features/authentication/screens/signin/signin_screen.dart';
import 'package:networks_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:networks_app/features/groups/screens/files/files_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const signup = '/signup';
  // static const files = '/files';

  static List<GetPage> routes = [
    GetPage(
        name: signin,
        page: () => const SigninScreen(),
        binding: SigninBinding(),
    ),

    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),

    // GetPage(
    //   name: files,
    //   page: () => const FilesScreen(),
    //   binding: FilesBinding(),
    // ),
  ];
}