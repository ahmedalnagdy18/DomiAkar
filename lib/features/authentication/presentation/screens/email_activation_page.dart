import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:flutter/material.dart';

class EmailActivationPage extends StatelessWidget {
  const EmailActivationPage({super.key, required this.isForgetPassword});
  final bool isForgetPassword;
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
                        child: Image.asset('assets/images/email_verifed.png')),
                    SizedBox(height: 12),
                    Text('Verify your email', style: AppTexts.meduimHeading),
                    SizedBox(height: 12),
                    Text(
                      'Check your email and click on the link that sent to you then login',
                      style: AppTexts.verySmallBody.copyWith(
                        color: AppColors.gray400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              MainAppButton(
                onPressed: () {
                  if (isForgetPassword == true) {
                    NavigationHelper.goToCreateNewPasswordPage(context);
                  }
                  if (isForgetPassword == false) {
                    NavigationHelper.goToSelectRolePage(context);
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
}
