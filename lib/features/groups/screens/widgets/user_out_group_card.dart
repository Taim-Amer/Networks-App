import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class UserOutGroupCard extends StatelessWidget {
  const UserOutGroupCard({super.key, required this.name, required this.email, required this.userID});

  final String name, email;
  final int userID;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      margin: const EdgeInsets.only(top: TSizes.defaultSpace),
      borderColor: dark ? TColors.secondaryLightColor.withOpacity(0.15) : TColors.secondaryDarkColor.withOpacity(0.15),
      child: Row(
        children: [
          const Icon(Iconsax.user, color: TColors.primary, size: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(
                  //   userID.toString(),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  Text(
                    email,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 80.w,
            height: 35.h,
            child: OutlinedButton(
                onPressed: () => GroupController.instance.createInvitation(userID: userID, groupID: TCacheHelper.getData(key: 'group_id')),
                child: Text("Add", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: TColors.redColor, fontSize: 12),),
            ),
          )
        ],
      ),
    );
  }
}
