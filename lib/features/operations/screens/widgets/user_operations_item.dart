import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class UserOperationsItem extends StatelessWidget {
  const UserOperationsItem({super.key, required this.fileName, required this.operationName});

  final String fileName;
  final String operationName;

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
          Text(operationName, maxLines: 1, overflow: TextOverflow.ellipsis),
          const Icon(Icons.arrow_forward, color: TColors.secondary, weight: 50, size: 40,),
          Text(fileName, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
        ],
      ),
    );
  }
}
