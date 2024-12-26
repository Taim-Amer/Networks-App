import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/features/files/controllers/file_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/sizes.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class FileRequestItem extends StatelessWidget {
  const FileRequestItem({super.key, required this.fileName, required this.destinationUser, required this.isFree, required this.fileID});

  final String fileName;
  final int fileID;
  final String destinationUser;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      height: 100.h,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      margin: const EdgeInsets.only(top: TSizes.defaultSpace),
      borderColor: dark ? TColors.secondaryLightColor.withOpacity(0.15) : TColors.secondaryDarkColor.withOpacity(0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   children: [
          //     Icon(Icons.verified_user_outlined, color: isFree ? TColors.primary : TColors.redColor, size: 30,),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(FileController.instance.getFileRequestsModel.value.response)
              Text(fileName, maxLines: 1, overflow: TextOverflow.ellipsis),
              const Icon(Icons.arrow_forward, color: TColors.secondary, weight: 50, size: 40,),
              Text(destinationUser, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => FileController.instance.fileResponse(fileID: fileID, ok: 1),
                icon: const Icon(Icons.check_circle_outline, color: TColors.primary, size: 30,),
              ),
              IconButton(
                onPressed: () => FileController.instance.fileResponse(fileID: fileID, ok: 0),
                icon: const Icon(Icons.check_circle_outline, color: TColors.redColor, size: 30,),
              )
            ],
          )
        ],
      ),
    );
  }
}
