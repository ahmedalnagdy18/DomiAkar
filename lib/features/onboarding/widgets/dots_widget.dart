import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget(
      {super.key,
      required this.dotsCount,
      required this.position,
      this.sized,
      this.activeSizeH,
      this.activeSizeW,
      this.activeColor,
      this.borderColor});
  final int dotsCount;
  final int position;
  final double? sized;
  final double? activeSizeH;
  final double? activeSizeW;
  final Color? activeColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        size: Size.square(sized ?? 12),
        activeSize: Size(activeSizeW ?? 25, activeSizeH ?? 10),
        activeShape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5.0),
        ),
        activeColor: activeColor ?? AppColors.primary600,
        color: AppColors.gray300,
        spacing: const EdgeInsets.all(3),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
