import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/icons/circular_icon.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularIcon(
      icon: Icons.arrow_forward_ios_rounded,
      size: TSizes.iconMd,
      color: dark ? TColors.lightGrey :const Color(0xFF353535),
      backgroundColor: dark ? TColors.darkGrey :TColors.borderPrimary,
      width: 34.w,
      height: 34.h,
      radius: 14.r,
      onPressed: () => Get.back(),
    );
  }
}