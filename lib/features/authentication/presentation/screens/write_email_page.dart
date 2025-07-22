import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriteEmailPage extends StatefulWidget {
  const WriteEmailPage({super.key});

  @override
  State<WriteEmailPage> createState() => _WriteEmailPageState();
}

class _WriteEmailPageState extends State<WriteEmailPage> {
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isEmailError = false;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _email.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    final isValid = EmailValidator.validate(_email.text);
    setState(() {
      isEmailError = !isValid && _email.text.isNotEmpty;
      isButtonEnabled = isValid && _email.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Write your Email', style: AppTexts.meduimHeading),
              SizedBox(height: 12),
              Text(
                'Write your email adress to change your password',
                style: AppTexts.regularBody.copyWith(color: AppColors.gray400),
              ),
              SizedBox(height: 22),
              Text('Email', style: AppTexts.smallHeading),
              SizedBox(height: 6),
              TextFieldWidget(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                autovalidateMode: AutovalidateMode.onUnfocus,
                hintText: 'Email*',
                controller: _email,
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    setState(() {
                      isEmailError = true;
                    });
                    return isEmailError == true
                        ? 'please write your email correctly'
                        : null;
                  } else {
                    setState(() {
                      isEmailError = false;
                    });
                  }
                  return null;
                },
                fillColor:
                    isEmailError == true ? AppColors.error25 : Colors.white,
              ),
              Spacer(),
              SafeArea(
                child: MainAppButton(
                  onPressed: isButtonEnabled
                      ? () async {
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _email.text.trim(),
                            );
                            if (!mounted) return;
                            showDialog(
                              barrierDismissible: false,
                              context: !mounted ? context : context,
                              builder: (_) => AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text("Check your email"),
                                content: Text(
                                    "We sent you a password reset link. Please check your inbox and follow the instructions."),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            // Optional: Show error toast/message
                            print("Error: ${e.message}");
                          }
                        }
                      : null,
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
