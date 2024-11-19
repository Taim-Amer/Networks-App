import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:networks_app/features/home/controllers/home_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController.instance;
    return Obx(() => NavigationRail(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.onItemTapped,
          labelType:
              NavigationRailLabelType.all, // Displays labels next to icons
          leading: const SizedBox(height: 20), // Add space at the top if needed
          groupAlignment: 0.0, // Aligns the items to the top of the rail
          selectedLabelTextStyle: const TextStyle(
            color: TColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelTextStyle: const TextStyle(
            color: TColors.secondary,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          selectedIconTheme: const IconThemeData(
            color: TColors.primary,
            size: 36, // Increased icon size for better visibility
          ),
          unselectedIconTheme: const IconThemeData(
            color: TColors.secondary,
            size: 32,
          ),
          minWidth: 100, // Increased width to accommodate larger labels
          destinations: const [
            NavigationRailDestination(
              icon: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 16.0), // Adds space between icons
                child: Icon(Icons.group),
              ),
              selectedIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(Icons.group, color: TColors.primary),
              ),
              label: Text('My Groups'),
            ),
            NavigationRailDestination(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(Icons.group_add),
              ),
              selectedIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(Icons.group_add, color: TColors.primary),
              ),
              label: Text('Create Group'),
            ),
          ],
        ));
  }
}
