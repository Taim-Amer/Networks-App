import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/groups/screens/widgets/create_group_dialog.dart';
import 'package:networks_app/features/groups/screens/widgets/group_card.dart';
import 'package:networks_app/responsive.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({super.key});

  @override
  Widget build(BuildContext context) {
    final size = THelperFunctions.screenSize();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace * 1.5,
                  vertical:
                  TSizes.defaultSpace / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () => showCreateGroupDialog(context),
              icon: const Icon(Icons.add),
              label: const Text("Create Group"),
            ),
          ],
        ),
        const SizedBox(height: TSizes.defaultSpace),
        Responsive(
          mobile: GroupGrid(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
          ),
          tablet: const GroupGrid(),
          desktop: GroupGrid(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class GroupGrid extends StatelessWidget {
  const GroupGrid({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final groupList = GroupController.instance.groupModel.value.response;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: groupList == null ? 0 : (groupList.length < 8 ? groupList.length : 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: TSizes.defaultSpace,
        mainAxisSpacing: TSizes.defaultSpace,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final group = groupList?[index];
        return GroupCard(
          isOwner: group?.isOwner ?? false,
          name: group?.name ?? '',
          groupID: group?.id ?? 1,
        );
      },
    );
  }
}
