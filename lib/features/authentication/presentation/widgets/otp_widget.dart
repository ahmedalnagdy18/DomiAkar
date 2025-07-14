import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget(
      {super.key, required this.controller, this.onCompleted, this.color});
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      onCompleted: onCompleted,
      controller: controller,
      preFilledWidget: const Text(
        '_',
        style: TextStyle(color: Colors.grey),
      ),
      errorText: 'The code is not valid',
      errorTextStyle: const TextStyle(
        color: Colors.red,
      ),
      defaultPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.gray300,
            ),
          )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      length: 4,
      focusedPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary600,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.primary600,
            ),
          )),
      textInputAction: TextInputAction.next,
    );
  }
}
