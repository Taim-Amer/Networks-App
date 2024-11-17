
import 'package:flutter/material.dart';
import 'package:networks_app/app.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await TCacheHelper.init();
  // Get.testMode = true;
  runApp(const App());
}
