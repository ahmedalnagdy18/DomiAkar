import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth: 200,
                        ),
                        child: Image.asset('assets/images/success.png')),
                    SizedBox(height: 12),
                    Text('Success!', style: AppTexts.meduimHeading),
                    SizedBox(height: 12),
                    Text(
                      'You password has been changed. Please log in again with a new password.',
                      style: AppTexts.verySmallBody.copyWith(
                        color: AppColors.gray400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              MainAppButton(
                onPressed: () {},
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
