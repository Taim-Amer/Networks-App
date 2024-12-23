// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:networks_app/utils/constants/sizes.dart';


DataRow FileRow({required String fileName, required String updatedDate, required String isFree}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/doc_file.svg",
              height: 30,
              width: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Text(fileName, style: Theme.of(Get.context!).textTheme.bodyMedium)),

          ],
        ),
      ),
      DataCell(Text(updatedDate,style: Theme.of(Get.context!).textTheme.bodyMedium)),
      DataCell(Text(isFree,style: Theme.of(Get.context!).textTheme.bodyMedium)),
    ],
  );
}
