import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/features/operations/controllers/operations_controller.dart';
import 'package:networks_app/features/operations/screens/widgets/user_operations_item.dart';

class UserOperationsList extends StatelessWidget {
  const UserOperationsList({super.key});

  @override
  Widget build(BuildContext context) {
    final userOperations = OperationsController.instance.userOperationsModel.value.response;

    return SizedBox(
      height: 440.h,
      child: userOperations == null || userOperations.isEmpty ? Center(
        child: Text(
          "No Operations for this user",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ) : ListView.builder(
        itemCount: userOperations.length,
        itemBuilder: (context, index) {
          final userOperation = userOperations[index];
          return UserOperationsItem(
            fileName: userOperation.operation!,
            operationName: userOperation.file!.name!,
          );
        },
      ),
    );
  }
}
