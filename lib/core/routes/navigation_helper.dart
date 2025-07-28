import 'package:domi_aqar/core/common/success_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/create_new_password.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/email_activation_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/login_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/otp_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/register_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/select_receive_code_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/select_role_page.dart';
import 'package:domi_aqar/features/home/presentation/screens/main_page.dart';
import 'package:domi_aqar/features/home/presentation/screens/see_all_page.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static void goToRegisterPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ));
  }

  static void goToLoginPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }

  static void goToSelectReceiveCodePage(
      {required BuildContext context,
      required bool isForgetPassword,
      String? email,
      String? phoneNumber}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectReceiveCodePage(
            isForgetPassword: isForgetPassword,
            email: email,
            phoneNumber: phoneNumber,
          ),
        ));
  }

  static void goToOtpPage(BuildContext context, bool isForgetPassword) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpPage(isForgetPassword: isForgetPassword),
        ));
  }

  static void goToCreateNewPasswordPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateNewPassword(),
        ));
  }

  static void goToSuccessPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessPage(),
        ));
  }

  static void goToEmailActivationPage(
      BuildContext context, bool isForgetPassword) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              EmailActivationPage(isForgetPassword: isForgetPassword),
        ));
  }

  static void goToSelectRolePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectRolePage(),
        ));
  }

  static void goToMainPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
  }

  static void goToSeeMorePage(
      {required BuildContext context, required String appbarTitle}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeeMorePage(appbarTitle: appbarTitle),
        ));
  }
}
