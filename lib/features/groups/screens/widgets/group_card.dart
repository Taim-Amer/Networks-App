import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/main/screen/widgets/progress_line.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.name, required this.groupID, required this.isOwner,
  });

  final String name;
  final int groupID;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => GroupController.instance.getUsersInGroup(groupID: groupID).then((value) => TCacheHelper.saveData(key: 'group_id', value: groupID)),
      child: TRoundedContainer(
        backgroundColor: dark ? TColors.secondaryDarkColor : TColors.secondaryLightColor,
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TRoundedContainer(
                  height: 40,
                  width: 40,
                  backgroundColor: TColors.secondary.withOpacity(.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/icons/group-svgrepo-com.svg", colorFilter: const ColorFilter.mode(TColors.secondary, BlendMode.srcIn)),
                  ),
                ),
                TRoundedContainer(
                  backgroundColor: isOwner ? TColors.primary : TColors.redColor,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(isOwner ? 'Owner' : 'Member', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 12)),
                  )),
                )
              ],
            ),
            Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
            const ProgressLine(color: TColors.secondary, percentage: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("133 Members", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
                Text("1GB Files", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
