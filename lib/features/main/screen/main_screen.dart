import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/loaders/loading_widget.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/main/controllers/menu_app_controller.dart';
import 'package:networks_app/features/main/screen/home_screen.dart';
import 'package:networks_app/responsive.dart';
import 'package:networks_app/features/main/screen/widgets/side_menu.dart';
import 'package:networks_app/utils/constants/enums.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MenuAppController.instance.scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))const Expanded(child: SideMenu()),
            Obx((){
              Widget current;
              GroupController.instance.getGroupsApiStatus.value == RequestState.loading ? current = const Expanded(flex: 6, child: Center(child: LoadingWidget())) : current = const Expanded(flex: 6, child: HomeScreen());
              return current;
            }),
          ],
        ),
      ),
    );
  }
}
