import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:flutter/material.dart';

class SelectReceiveCodePage extends StatefulWidget {
  const SelectReceiveCodePage({super.key, required this.isForgetPassword});
  final bool isForgetPassword;
  @override
  State<SelectReceiveCodePage> createState() => _SelectReceiveCodePageState();
}

class _SelectReceiveCodePageState extends State<SelectReceiveCodePage> {
  int selectedBorder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.isForgetPassword ? 'Forgot Password' : 'Select verify',
                  style: AppTexts.meduimHeading),
              const SizedBox(height: 12),
              Text(
                widget.isForgetPassword
                    ? 'Select which contact details should we use to reset your password'
                    : 'Select which contact details should we use to verify your email',
                style: AppTexts.regularBody.copyWith(color: AppColors.gray400),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: Column(
                  children: [
                    _selctionBox(
                      index: 0,
                      selected: selectedBorder == 0,
                      onTap: () => setState(() => selectedBorder = 0),
                      titleType: 'Via phone',
                      hint: '+20 10 98***488',
                      icon: Icons.phone_outlined,
                    ),
                    const SizedBox(height: 16),
                    _selctionBox(
                      index: 1,
                      selected: selectedBorder == 1,
                      onTap: () => setState(() => selectedBorder = 1),
                      titleType: 'Via email',
                      hint: 'mu***@gmail.com',
                      icon: Icons.messenger_outline_outlined,
                    ),
                  ],
                ),
              ),
              MainAppButton(
                onPressed: () {
                  if (selectedBorder == 0) {
                    NavigationHelper.goToOtpPage(
                        context, widget.isForgetPassword);
                  }
                },
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selctionBox({
    required int index,
    required bool selected,
    required VoidCallback onTap,
    required String titleType,
    required String hint,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? AppColors.primary600 : AppColors.gray300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary100,
              ),
              child: Icon(icon, color: AppColors.primary600),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleType,
                  style:
                      AppTexts.verySmallBody.copyWith(color: AppColors.gray400),
                ),
                Text(hint, style: AppTexts.smallBody),
              ],
            )
          ],
        ),
      ),
    );
  }
}
