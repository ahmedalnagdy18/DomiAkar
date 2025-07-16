import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _newPasswordFocusNode = FocusNode();
  final _confirmPassswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool isNewPasswordError = false;
  bool isConfirmPasswordError = false;
  bool isObscuretext = true;
  bool isObscuretext2 = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPassswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create New Password',
                          style: AppTexts.meduimHeading),
                      const SizedBox(height: 12),
                      Text(
                        'Please enter a new password to change',
                        style: AppTexts.regularBody
                            .copyWith(color: AppColors.gray400),
                      ),
                      const SizedBox(height: 22),
                      Text('New Password', style: AppTexts.smallHeading),
                      SizedBox(height: 6),
                      TextFieldWidget(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscuretext = !isObscuretext;
                            });
                          },
                          child: Icon(
                            size: 20,
                            isObscuretext
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        obscureText: isObscuretext,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        focusNode: _newPasswordFocusNode,
                        hintText: 'Passowrd*',
                        controller: _newPasswordController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isNewPasswordError = false;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            isNewPasswordError = true;
                            return 'Please enter your new password';
                          }

                          if (value.length < 6) {
                            isNewPasswordError = true;
                            return 'Password must be at least 6 characters';
                          } else {
                            isNewPasswordError = false;
                          }
                          return null;
                        },
                        fillColor: isNewPasswordError == true
                            ? AppColors.error25
                            : Colors.white,
                      ),
                      SizedBox(height: 22),
                      Text('Confim Password', style: AppTexts.smallHeading),
                      SizedBox(height: 6),
                      TextFieldWidget(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscuretext2 = !isObscuretext2;
                            });
                          },
                          child: Icon(
                            size: 20,
                            isObscuretext2
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        obscureText: isObscuretext2,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        focusNode: _confirmPassswordFocusNode,
                        controller: _confirmPasswordController,
                        hintText: 'Passowrd*',
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isConfirmPasswordError = false;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            isConfirmPasswordError = true;
                            return 'Please renter the password';
                          }

                          if (_newPasswordController.text !=
                              _confirmPasswordController.text) {
                            isConfirmPasswordError = true;
                            return 'Password must be as the same new password';
                          } else {
                            isConfirmPasswordError = false;
                          }
                          return null;
                        },
                        fillColor: isConfirmPasswordError == true
                            ? AppColors.error25
                            : Colors.white,
                      ),
                    ],
                  ),
                ),
                MainAppButton(
                  onPressed: (_formKey.currentState?.validate() ?? false)
                      ? () {
                          NavigationHelper.goToSuccessPage(context);
                        }
                      : null,
                  text: 'Change password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
