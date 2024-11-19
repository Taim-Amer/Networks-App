import 'package:flutter/material.dart';
import 'package:networks_app/common/widgets/appbar/appbar.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/groups/controllers/files_controller.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: TRoundedContainer(
        child: Row(
          children: [
            Text(FilesController.instance.fileModel.value.response?.first.name ?? "")
          ],
        ),
      ),
    );
  }
}
