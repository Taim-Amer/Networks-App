import 'package:flutter/material.dart';
import 'package:networks_app/features/main/screen/widgets/storage_info_card.dart';

class StorageInfoList extends StatelessWidget {
  const StorageInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StorageInfoCard(
          svgSrc: "assets/icons/Documents.svg",
          title: "Documents Files",
          amountOfFiles: "1.3GB",
          numOfFiles: 1328,
        ),
        StorageInfoCard(
          svgSrc: "assets/icons/Documents.svg",
          title: "Documents Files",
          amountOfFiles: "1.3GB",
          numOfFiles: 1328,
        ),
        StorageInfoCard(
          svgSrc: "assets/icons/media.svg",
          title: "Media Files",
          amountOfFiles: "15.3GB",
          numOfFiles: 1328,
        ),
        StorageInfoCard(
          svgSrc: "assets/icons/folder.svg",
          title: "Other Files",
          amountOfFiles: "1.3GB",
          numOfFiles: 1328,
        ),
        StorageInfoCard(
          svgSrc: "assets/icons/unknown.svg",
          title: "Unknown",
          amountOfFiles: "1.3GB",
          numOfFiles: 140,
        ),
      ],
    );
  }
}
