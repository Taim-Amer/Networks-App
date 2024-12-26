// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/features/files/screens/widgets/file_version_dialog.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:path_provider/path_provider.dart';


DataRow FileRow({required String fileName, required String updatedDate, required String isFree, required int fileID}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              // "assets/icons/doc_file.svg",
              "assets/icons/Documents.svg",
              height: 30,
              width: 30,
              colorFilter: ColorFilter.mode(isFree == "Free" ? Colors.blue : TColors.yellowColor, BlendMode.srcIn),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Text(fileName, style: Theme.of(Get.context!).textTheme.bodyMedium)),
          ],
        ),
      ),
      DataCell(Text(updatedDate,style: Theme.of(Get.context!).textTheme.bodyMedium)),
      DataCell(Text(isFree,style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(color: isFree == "Free" ? Colors.blue : TColors.yellowColor))),
      DataCell(isFree == "Free" ? SizedBox(
        width: 90.w,
        height: 35.h,
        child: OutlinedButton(
          onPressed: () => FileController.instance.checkIn(fileID: fileID),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue, width: 2),
            foregroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
          ),
          child: Text("Check", style: Theme.of(Get.context!).textTheme.labelLarge,),
        ),
      ) : const SizedBox()),
      DataCell(IconButton(
        onPressed: () => FileController.instance.downloadFile(fileID: fileID),
        icon: Icon(Icons.download, size: 20, color: isFree == "Free" ? Colors.blue : TColors.yellowColor,))),
      DataCell(IconButton(
        onPressed: () => FileController.instance.getFileVersion(fileID: fileID).then((response) => showFileVersionDialog(Get.context!)),
        icon: Icon(Icons.info_outline, size: 20, color: isFree == "Free" ? Colors.blue : TColors.yellowColor,))),
    ],
  );
}
