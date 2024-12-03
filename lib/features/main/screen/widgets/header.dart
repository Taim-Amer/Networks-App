import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/main/controllers/menu_app_controller.dart';
import 'package:networks_app/features/main/screen/widgets/search_field.dart';
import 'package:networks_app/responsive.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final menuAppController = Get.find<MenuAppController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!Responsive.isDesktop(context))IconButton(icon: const Icon(Icons.menu), onPressed: menuAppController.controlMenu),
        const Expanded(flex: 1, child: SearchField()),
        // if (!Responsive.isMobile(context)) Text("Home", style: Theme.of(context).textTheme.titleLarge),
        if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
      ],
    );
  }
}
