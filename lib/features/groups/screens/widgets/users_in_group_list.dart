import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/groups/screens/widgets/user_in_group_card.dart';
import 'package:networks_app/features/groups/screens/widgets/users_out_group_dialog.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    var groupId = TCacheHelper.getData(key: 'group_id');
    final bool isOwner = GroupController.instance.isUserOwner(groupId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isOwner ? TextButton(
            onPressed: () {
              GroupController.instance.getUsersOutGroup(groupID: TCacheHelper.getData(key: 'group_id'));
              showUserOutGroupDialog(context);
            },
            child: const Text("Add Members")) : const SizedBox(),
        SizedBox(
          height: 450.h,
          child: ListView.builder(
            itemCount: GroupController.instance.usersInGroupModel.value.response?.length ?? 0,
            itemBuilder: (context, index) => UserInGroupCard(
              userID: GroupController.instance.usersInGroupModel.value.response?[index].id ?? 0,
              name: GroupController.instance.usersInGroupModel.value.response?[index].name ?? '',
              email: GroupController.instance.usersInGroupModel.value.response?[index].email ?? '',
            ),
          ),
        ),
      ],
    );
  }
}
