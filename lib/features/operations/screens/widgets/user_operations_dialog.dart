import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/files/screens/widgets/file_requests_list.dart';
import 'package:networks_app/features/operations/screens/widgets/user_operations_list.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

Future<dynamic> showUserOperationsDialog(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
        ],
      ),
      backgroundColor: dark ? TColors.darkScaffold : TColors.lightScaffold,
      content: SizedBox(
        width: 400.w,
        height: 450.h,
        child: const UserOperationsList(),
      ),
    ),
  );
}