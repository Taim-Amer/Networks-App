import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:networks_app/utils/constants/sizes.dart';


DataRow FileRow({required String fileName}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/Figma_file.svg",
              height: 30,
              width: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Text(fileName, style: Theme.of(Get.context!).textTheme.bodyMedium)),

          ],
        ),
      ),
      DataCell(Text("27-02-2024",style: Theme.of(Get.context!).textTheme.bodyMedium)),
      DataCell(Text("19.0mb",style: Theme.of(Get.context!).textTheme.bodyMedium)),
    ],
  );
}
