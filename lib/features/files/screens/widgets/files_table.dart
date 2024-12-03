import 'package:flutter/material.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/screens/widgets/file_row.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';


class FilesTable extends StatelessWidget {
  const FilesTable({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      backgroundColor: dark ? TColors.secondaryDarkColor : TColors.secondaryLightColor,
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
                    label: Text("File Name", style: Theme.of(context).textTheme.headlineSmall)),
                DataColumn(
                    label: Text("Date", style: Theme.of(context).textTheme.headlineSmall)),
                DataColumn(
                    label: Text("Size", style: Theme.of(context).textTheme.headlineSmall)),
              ],
              rows: List.generate(
                  FileController.instance.fileModel.value.response?.length ?? 0,
                    (index) => FileRow(fileName: FileController.instance.fileModel.value.response?[index].name ?? '',
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}