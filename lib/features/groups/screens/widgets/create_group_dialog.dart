import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/loaders/loading_widget.dart';
import 'package:networks_app/common/widgets/text_fields/custom_text_field.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

Future<dynamic> showCreateGroupDialog(BuildContext context){
  final dark = THelperFunctions.isDarkMode(context);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: dark ? TColors.darkScaffold : TColors.lightScaffold,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        width: 100.w,
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              hintText: 'Group Name',
              controller: GroupController.instance.groupNameController,
            ),
            Obx(() => GroupController.instance.createGroupsApiStatus.value == RequestState.loading ? const LoadingWidget() : SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => GroupController.instance.createGroup(),
                child: const Text('Create'),
              ),
            ))
          ],
        ),
      ),
    ),
  );
}