import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/screens/widgets/file_request_item.dart';
import 'package:networks_app/features/groups/models/get_group_invitation_model.dart';
import 'package:networks_app/features/groups/screens/widgets/group_request_item.dart';

class GroupRequestsList extends StatelessWidget {
  const GroupRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final fileRequests = FileController.instance.getFileRequestsModel.value.response;

    return SizedBox(
      height: 440.h,
      child: fileRequests == null || fileRequests.isEmpty ? Center(
        child: Text(
          "No group requests available.",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ) : ListView.builder(
        itemCount: fileRequests.length,
        itemBuilder: (context, index) {
          final fileRequest = fileRequests[index];
          return GroupRequestItem(
            groupName: fileRequest.name ?? "",
          );
        },
      ),
    );
  }
}
