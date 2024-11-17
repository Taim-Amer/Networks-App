import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/utils/constants/sizes.dart';

class TSpacingStyle {
  static EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight.h,
    left: TSizes.defaultSpace.w,
    bottom: TSizes.defaultSpace.w,
    right: TSizes.defaultSpace.w,
  );
}