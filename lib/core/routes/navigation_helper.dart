import 'package:domi_aqar/features/authentication/presentation/screens/login_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/register_page.dart';
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
}
