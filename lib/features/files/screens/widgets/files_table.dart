import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/common/widgets/loaders/loading_widget.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/screens/widgets/file_row.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';


class FilesTable extends StatelessWidget {
  const FilesTable({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(() {
      final apiStatus = FileController.instance.getFilesApiStatus.value;
      final files = FileController.instance.fileModel.value.response;

      return TRoundedContainer(
        height: 350,
        width: double.infinity,
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        backgroundColor:
        dark ? TColors.secondaryDarkColor : TColors.secondaryLightColor,
        child: _buildContent(apiStatus, files, context),
      );
    });
  }

  Widget _buildContent(RequestState status, List<dynamic>? files, BuildContext context) {
    switch (status) {
      case RequestState.loading:
        return const Center(child: LoadingWidget());

      case RequestState.success:
        if (files == null || files.isEmpty) {
          return const Center(
            child: Text('No Data Available'),
          );
        }
        return _buildDataTable(files, context);

      case RequestState.error:
        return const Center(
          child: Text(
            'Failed to load files. Please try again.',
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
        );

      case RequestState.noData:
        return const Center(
          child: Text(
            'No files found in this group.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );

      default:
        return const SizedBox();
    }
  }

  Widget _buildDataTable(List<dynamic> files, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: TSizes.spaceBtwSections,
              dataRowHeight: TSizes.spaceBtwSections * 1.5,
              columns: [
                DataColumn(
                  label: Text(
                    "File Name",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Date",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Size",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
              rows: List.generate(
                files.length,
                    (index) => FileRow(fileName: files[index].name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
