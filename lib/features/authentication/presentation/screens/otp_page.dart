import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:domi_aqar/features/authentication/presentation/widgets/otp_widget.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.isForgetPassword});
  final bool isForgetPassword;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _otpController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _otpController.text.length > 3;
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Verify your Email', style: AppTexts.meduimHeading),
                  const SizedBox(height: 12),
                  Text(
                    'Please enter 6 digit verification that have been sent to your email address',
                    style:
                        AppTexts.regularBody.copyWith(color: AppColors.gray400),
                  ),
                  const SizedBox(height: 22),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OtpWidget(
                    color: Colors.black,
                    controller: _otpController,
                    onCompleted: (value) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 33),
                  Text('Don’t receive code ?', style: AppTexts.smallBody),
                  SizedBox(height: 4),
                  Text(
                    'Resend code',
                    style: AppTexts.smallBody.copyWith(
                      color: AppColors.error400,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  MainAppButton(
                    onPressed: isButtonEnabled
                        ? () {
                            if (widget.isForgetPassword == true) {
                              NavigationHelper.goToCreateNewPasswordPage(
                                  context);
                            }
                            if (widget.isForgetPassword == false) {
                              print('go to profile');
                            }
                          }
                        : null,
                    text: 'Verify',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
