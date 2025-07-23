import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:domi_aqar/core/shared_prefrances/shared_prefrances.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutDailogeWidget extends StatelessWidget {
  const LogoutDailogeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Are you sure?"),
      content: const Text("Do you really want to sign out?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await FirebaseAuth.instance.signOut();
            await SharedPrefrance.instanc.removeFromShared(key: 'userName');
            NavigationHelper.goToLoginPage(context);
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
