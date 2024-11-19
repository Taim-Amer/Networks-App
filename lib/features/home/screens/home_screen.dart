import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/home/controllers/home_controller.dart';
import 'package:networks_app/features/home/screens/widgets/navigation_rail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController.instance;

    return Scaffold(
      body: Row(
        children: [
          const NavigationRailWidget(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
              child: Obx(() => HomeController.widgetOptions.elementAt(controller
                  .selectedIndex.value))), // Now it's safe to use Obx here
        ],
      ),
    );
  }
}
