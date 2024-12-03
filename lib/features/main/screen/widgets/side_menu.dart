import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:networks_app/features/authentication/controllers/signin_controller.dart';
import 'package:networks_app/features/main/screen/widgets/drawer_list_tile.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Drawer(
      backgroundColor: dark ? TColors.secondaryDarkColor : TColors.secondaryLightColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(SigninController.instance.signinModel.value.userData?.name ?? '', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w400)),
                Text(SigninController.instance.signinModel.value.userData?.email ?? '', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 17, fontWeight: FontWeight.w200)),
              ],
            ),
          ),
          DrawerListTile(
            title: "Home",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Groups",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
