import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networks_app/utils/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(color: TColors.buttonPrimary, size: 70);
  }
}
