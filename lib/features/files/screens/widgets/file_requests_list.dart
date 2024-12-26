import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/app.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/screens/widgets/file_request_item.dart';

class FileRequestsList extends StatelessWidget {
  const FileRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440.h,
      child: ListView.builder(
        itemCount: FileController.instance.getFileRequestsModel.value.response?.length ?? 0,
        itemBuilder: (context, index){
          final fileRequestsList = FileController.instance.getFileRequestsModel.value.response?[index];
          return FileRequestItem(
            fileName: fileRequestsList?.name! ?? "",
            destinationUser: fileRequestsList?.toUserName! ?? "",
            isFree: fileRequestsList?.isFree == 1 ? true : false,
          );
        },
      ),
    );
  }
}
