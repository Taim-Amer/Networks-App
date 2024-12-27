import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/operations/controllers/operations_controller.dart';
import 'package:networks_app/features/operations/screens/widgets/user_operations_item.dart';

class FileOperationsList extends StatelessWidget {
  const FileOperationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final fileOperations = OperationsController.instance.fileOperationsModel.value.response;

    return SizedBox(
      height: 440.h,
      child: fileOperations == null || fileOperations.isEmpty ? Center(
        child: Text(
          "No Operations for this file",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ) : ListView.builder(
        itemCount: fileOperations.length,
        itemBuilder: (context, index) {
          final fileOperation = fileOperations[index];
          return UserOperationsItem(
            fileName: fileOperation.operation!,
            operationName: fileOperation.user!.name!,
          );
        },
      ),
    );
  }
}
