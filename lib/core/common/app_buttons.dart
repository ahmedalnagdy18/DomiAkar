import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton(
      {super.key,
      required this.onPressed,
      this.textColor,
      this.fontSize,
      required this.text,
      this.buttonColor,
      this.borderColor});
  final Function()? onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final double? fontSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: AppColors.gray300,
      highlightElevation: 0,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      color: buttonColor ?? AppColors.primary600,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        // side: BorderSide(
        //   color: borderColor ?? AppColors.primary600,
        // ),
      ),
      height: 56,
      elevation: 0,
      minWidth: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTexts.smallHeading.copyWith(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16,
        ),
      ),
    );
  }
}
