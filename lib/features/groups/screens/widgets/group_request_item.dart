import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class GroupRequestItem extends StatelessWidget {
  const GroupRequestItem({super.key, required this.groupName});

  final String groupName;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      height: 100.h,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      margin: const EdgeInsets.only(top: TSizes.defaultSpace),
      borderColor: dark ? TColors.secondaryLightColor.withOpacity(0.15) : TColors.secondaryDarkColor.withOpacity(0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(groupName, maxLines: 1, overflow: TextOverflow.ellipsis),
          Row(
            children: [
              IconButton(
                onPressed: () => GroupController.instance.invitationResponse(ok: 1),
                icon: const Icon(Icons.check_circle_outline, color: TColors.primary, size: 30,),
              ),
              IconButton(
                onPressed: () => GroupController.instance.invitationResponse(ok: 0),
                icon: const Icon(Icons.close, color: TColors.redColor, size: 30,),
              )
            ],
          )
        ],
      ),
    );
  }
}
