import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networks_app/bindings/signin_binding.dart';
import 'package:networks_app/localization/translations.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/router/app_router.dart';
import 'package:networks_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: AppRoutes.signin,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        // locale: Locale(language ?? 'en'),
        // fallbackLocale: const Locale('en'),
        initialBinding: SigninBinding()
      ),
    );
  }
}