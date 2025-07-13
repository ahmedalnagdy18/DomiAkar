import 'package:flutter/material.dart';

class AlertDailogWidget extends StatelessWidget {
  const AlertDailogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Agreement Required'),
      content:
          Text('You must agree with the terms and privacy policy to continue.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );
  }
}
