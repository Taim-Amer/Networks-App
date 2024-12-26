import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/screens/widgets/file_request_item.dart';

class FileRequestsList extends StatelessWidget {
  const FileRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final fileRequests = FileController.instance.getFileRequestsModel.value.response;

    return SizedBox(
      height: 440.h,
      child: fileRequests == null || fileRequests.isEmpty ? Center(
        child: Text(
          "No file requests available.",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ) : ListView.builder(
        itemCount: fileRequests.length,
        itemBuilder: (context, index) {
          final fileRequest = fileRequests[index];
          return FileRequestItem(
            fileName: fileRequest.name ?? "",
            destinationUser: fileRequest.toUserName ?? "",
            isFree: fileRequest.isFree == 1,
          );
        },
      ),
    );
  }
}
