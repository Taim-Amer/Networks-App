import 'package:get/get.dart';
import 'package:networks_app/bindings/group_bindings.dart';
import 'package:networks_app/bindings/home_bindings.dart';
import 'package:networks_app/bindings/signin_binding.dart';
import 'package:networks_app/features/authentication/screens/signin/signin_screen.dart';
import 'package:networks_app/features/groups/screens/group_screen.dart';
import 'package:networks_app/features/home/screens/home_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const home = '/home';
  static const group = "/group";

  static List<GetPage> routes = [
    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
      name: group,
      page: () => const GroupScreen(),
      binding: GroupBindings(),
      // transition: Transition.rightToLeft
    ),
  ];
}

//
//     GetPage(
//       name: otp,
//       page: () => const OtpScreen(),
//       binding: OtpBinding(),
//       transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//       name: signup,
//       page: () => SignupScreen(),
//       binding: SignupBinding(),
//       transition: Transition.rightToLeft,
//     ),
//
//     GetPage(
//       name: home,
//       page: () => const HomeScreen(),
//       binding: HomeBinding(),
//       transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//       name: profile,
//       page: () => const ProfileScreen(),
//       transition: Transition.rightToLeft,
//       binding: ProfileBinding(),
//     ),
//
//     GetPage(
//       name: profileEdit,
//       page: () => const ProfileEditScreen(),
//       binding: ProfileBinding(),
//       transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//       name: debtSchedule,
//       page: () => const DebtScheduleScreen(),
//       binding: DebtScheduleBinding(),
//       transition: Transition.rightToLeft,
//     ),
//
//     GetPage(
//       name: addPayment,
//       page: () => const PayAdditionScreen(),
//       binding: AdditionBinding(),
//       transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//         name: addDebt,
//         page: () => const DebtAdditionScreen(),
//         binding: AdditionBinding(),
//         transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//         name: clientProfile,
//         page: () => const ClientProfileScreen(),
//         binding: ClientProfileBinding(),
//         transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//         name: notations,
//         page: () => const NotationsScreen(),
//         binding: NotationsBinding(),
//         transition: Transition.rightToLeft
//     ),
//
//     GetPage(
//         name: settings,
//         page: () => const SettingsScreen(),
//         binding: SettingsBinding(),
//         transition: Transition.rightToLeft
//     ),