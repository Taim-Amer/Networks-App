import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/groups/controllers/group_controller.dart';
import 'package:networks_app/features/groups/screens/widgets/group_request_item.dart';

class GroupRequestsList extends StatelessWidget {
  const GroupRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final groupRequests = GroupController.instance.getGroupInvitationModel.value.response;

    return SizedBox(
      height: 440.h,
      child: groupRequests == null || groupRequests.isEmpty ? Center(
        child: Text(
          "No group requests available.",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ) : ListView.builder(
        itemCount: groupRequests.length,
        itemBuilder: (context, index) {
          final groupRequest = groupRequests[index];
          return GroupRequestItem(
            groupName: groupRequest.group?.name ?? "",
          );
        },
      ),
    );
  }
}
