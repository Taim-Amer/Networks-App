import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/groups/screens/widgets/user_out_group_card.dart';

class UserOutGroupList extends StatelessWidget {
  const UserOutGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      // width: 300.w,
      child: ListView.builder(
        itemCount: GroupController.instance.usersOutGroupModel.value.response?.length ?? 0,
        itemBuilder: (context, index) => UserOutGroupCard(
          userID: GroupController.instance.usersOutGroupModel.value.response?[index].id ?? 0,
          name: GroupController.instance.usersOutGroupModel.value.response?[index].name ?? '',
          email: GroupController.instance.usersOutGroupModel.value.response?[index].email ?? '',
        ),
      ),
    );
  }
}
