import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/operations/controllers/operations_controller.dart';
import 'package:networks_app/features/operations/screens/widgets/user_operations_dialog.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class UserInGroupCard extends StatelessWidget {
  const UserInGroupCard({super.key, required this.name, required this.email, required this.userID});

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
                  Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(email, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () => OperationsController.instance.getUserOperations(userID: userID).then((response) => showUserOperationsDialog(Get.context!)),
            icon: const Icon(Iconsax.info_circle, color: TColors.primaryColor, size: 20),
          )
        ],
      ),
    );
  }
}
