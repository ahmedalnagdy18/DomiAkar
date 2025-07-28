import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/alert_dailog_widget.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/inkweel_widget.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/extentions/app_extentions.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:domi_aqar/core/shared_prefrances/shared_prefrances.dart';
import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:domi_aqar/injection_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(signUpUsecase: sl()),
      child: const _RegisterPage(),
    );
  }
}

class _RegisterPage extends StatefulWidget {
  const _RegisterPage();

  @override
  State<_RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<_RegisterPage> {
  bool _isChecked = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  final _passswordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool isEmailError = false;
  bool isUserNameError = false;
  bool isPasswordError = false;
  bool isPhoneError = false;
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

    _userNameFocusNode.addListener(() {
      if (_userNameFocusNode.hasFocus && _username.text.isNotEmpty) {
        setState(() {
          isUserNameError = false;
        });
      }
    });

    _phoneFocusNode.addListener(() {
      if (_phoneFocusNode.hasFocus && _phone.text.isNotEmpty) {
        setState(() {
          isPhoneError = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _emailFocusNode.dispose();
    _userNameFocusNode.dispose();
    _passswordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state is SucsessRegisterState) {
          print('okay');
          NavigationHelper.goToSelectReceiveCodePage(
            context: context,
            isForgetPassword: false,
            email: _email.text,
            phoneNumber: _phone.text,
          );
          await SharedPrefrance.instanc
              .setUserName(key: 'userName', userName: _username.text);
        }
        if (state is ErrorRegisterState) {
          print(state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 22),
                      Text('Register Account', style: AppTexts.meduimHeading),
                      SizedBox(height: 12),
                      Text(
                        'Sign in with your email and password or social media to continue',
                        style: AppTexts.regularBody
                            .copyWith(color: AppColors.gray400),
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
                        fillColor: isEmailError == true
                            ? AppColors.error25
                            : Colors.white,
                      ),
                      SizedBox(height: 22),
                      Text('Username', style: AppTexts.smallHeading),
                      SizedBox(height: 6),
                      TextFieldWidget(
                        inputFormatters: [
                          PreventStartingSpaceInputFormatter(),
                        ],
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        focusNode: _userNameFocusNode,
                        controller: _username,
                        hintText: 'First Name* & Last Name*',
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isUserNameError = false;
                            });
                          }
                        },
                        validator: (value) {
                          if (_username.text.isEmpty) {
                            setState(() {
                              isUserNameError = true;
                            });
                            return isUserNameError == true
                                ? 'please write an username'
                                : null;
                          } else {
                            setState(() {
                              isUserNameError = false;
                            });
                          }
                          return null;
                        },
                        fillColor: isUserNameError == true
                            ? AppColors.error25
                            : Colors.white,
                      ),
                      SizedBox(height: 22),
                      Text('Phone', style: AppTexts.smallHeading),
                      SizedBox(height: 6),
                      TextFieldWidget(
                        maxLength: 11,
                        counterText: '',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        focusNode: _phoneFocusNode,
                        controller: _phone,
                        hintText: 'Phone Number*',
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isPhoneError = false;
                            });
                          }
                        },
                        validator: (value) {
                          if (_phone.text.isEmpty) {
                            setState(() {
                              isPhoneError = true;
                            });
                            return isPhoneError == true
                                ? 'please write your phone number'
                                : null;
                          }
                          if (_phone.text.length < 11) {
                            setState(() {
                              isPhoneError = true;
                            });
                            return isPhoneError == true
                                ? 'please check your phone number'
                                : null;
                          } else {
                            setState(() {
                              isPhoneError = false;
                            });
                          }
                          return null;
                        },
                        fillColor: isPhoneError == true
                            ? AppColors.error25
                            : Colors.white,
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
                            isObscuretext
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                      SizedBox(height: 22),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            },
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary700),
                                borderRadius: BorderRadius.circular(4),
                                color: _isChecked
                                    ? AppColors.primary700
                                    : Colors.transparent,
                              ),
                              child: _isChecked
                                  ? const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Agree with terms and privacy',
                              style: AppTexts.regularBody,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      MainAppButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_isChecked == false) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDailogWidget());
                            } else {
                              _registerButton(context);
                            }
                          }
                        },
                        text: state is LoadingRegisterState
                            ? 'Loading...'
                            : 'Sign Up',
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
                          Flexible(
                            child: Text(
                              'Already have an account?',
                              style: AppTexts.regularBody,
                            ),
                          ),
                          InkwellWidget(
                            onTap: () =>
                                NavigationHelper.goToLoginPage(context),
                            child: Text(
                              ' Login',
                              style: AppTexts.smallHeading
                                  .copyWith(color: AppColors.primary600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _registerButton(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).registerFuc(
        input: SignUpInput(
      email: _email.text,
      username: _username.text,
      phone: _phone.text,
      password: _password.text,
    ));
  }
}
