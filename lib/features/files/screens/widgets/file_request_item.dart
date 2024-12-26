import 'package:flutter/material.dart';
import 'package:networks_app/utils/constants/colors.dart';

class FileRequestItem extends StatelessWidget {
  const FileRequestItem({super.key, required this.fileName, required this.destinationUser, required this.isFree});

  final String fileName;
  final String destinationUser;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.verified_user_outlined, color: isFree ? TColors.primary : TColors.redColor, weight: 50, size: 40,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(FileController.instance.getFileRequestsModel.value.response)
            Text(fileName, maxLines: 1, overflow: TextOverflow.ellipsis),
            const Icon(Icons.arrow_forward, color: TColors.primary, weight: 50, size: 40,),
            Text(destinationUser, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
          ],
        ),
      ],
    );
  }
}
