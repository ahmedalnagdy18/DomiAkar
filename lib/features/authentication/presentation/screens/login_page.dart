import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool isEmailError = false;
  bool isUserNameError = false;
  bool isPasswordError = false;
  bool isObscuretext = true;

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus && _email.text.isNotEmpty) {
        setState(() {
          isEmailError = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _emailFocusNode.dispose();
    _passswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back !', style: AppTexts.meduimHeading),
                  SizedBox(height: 12),
                  Text(
                    'Sign in with your email and password or social media to continue',
                    style:
                        AppTexts.regularBody.copyWith(color: AppColors.gray400),
                  ),
                  SizedBox(height: 22),
                  Text('Email', style: AppTexts.smallHeading),
                  SizedBox(height: 6),
                  TextFieldWidget(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    focusNode: _emailFocusNode,
                    hintText: 'Email*',
                    controller: _email,
                    onChanged: (value) {
                      if (EmailValidator.validate(value)) {
                        setState(() {
                          isEmailError = false;
                        });
                      }
                    },
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
                  SizedBox(height: 22),
                  Text('Password', style: AppTexts.smallHeading),
                  SizedBox(height: 6),
                  TextFieldWidget(
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    focusNode: _passswordFocusNode,
                    controller: _password,
                    hintText: 'Password*',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscuretext = !isObscuretext;
                        });
                      },
                      child: Icon(
                        size: 20,
                        isObscuretext ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    obscureText: isObscuretext,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isPasswordError = false;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        isPasswordError = true;
                        return 'Please enter your password';
                      }

                      if (value.length < 6) {
                        isPasswordError = true;
                        return 'Password must be at least 6 characters';
                      } else {
                        isPasswordError = false;
                      }
                      return null;
                    },
                    fillColor: isPasswordError == true
                        ? AppColors.error25
                        : Colors.white,
                  ),
                  SizedBox(height: 14),
                  InkWell(
                    onTap: () => NavigationHelper.goToSelectReceiveCodePage(
                        context, true),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password ?',
                        style: AppTexts.smallBody
                            .copyWith(color: AppColors.primary600),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  MainAppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('xxzxzxzx');
                      }
                    },
                    text: 'Login',
                  ),
                  SizedBox(height: 22),
                  Align(
                      alignment: Alignment.center,
                      child: Text('Or', style: AppTexts.regularBody)),
                  SizedBox(height: 22),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.gray200,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/google.png'),
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have account ?',
                        style: AppTexts.regularBody,
                      ),
                      InkWell(
                        onTap: () => NavigationHelper.goToRegisterPage(context),
                        child: Text(
                          ' Sign Up',
                          style: AppTexts.smallHeading
                              .copyWith(color: AppColors.primary600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
