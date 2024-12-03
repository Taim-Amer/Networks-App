import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/utils/constants/colors.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    super.key,
    this.color = TColors.primaryColor,
    required this.percentage,
  });

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TRoundedContainer(
          height: 5,
          backgroundColor: color!.withOpacity(0.1),
          radius: 10,
        ),
        LayoutBuilder(
          builder: (context, constraints) => TRoundedContainer(
            height: 5.h,
            backgroundColor: color,
            width: constraints.maxWidth * (percentage! / 100),
            radius: 10,
          ),
        ),
      ],
    );
  }
}
