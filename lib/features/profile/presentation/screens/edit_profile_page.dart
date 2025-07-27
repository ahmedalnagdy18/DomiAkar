import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/extentions/app_extentions.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:domi_aqar/features/profile/presentation/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  UserDataModel? userData;
  bool isButtonEnabled = false;
  @override
  void initState() {
    userData = context.read<UserDataCubit>().userData;
    _username.text = userData?.username ?? "";
    _email.text = userData?.email ?? "";
    _phone.text = userData?.phone ?? "";
    _username.addListener(_updateButtonState);
    _email.addListener(_updateButtonState);
    _phone.addListener(_updateButtonState);
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = (_username.text != userData?.username) ||
          (_phone.text != userData?.phone) ||
          (_email.text != userData?.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              UploadImageWidget(
                userData: userData!,
              ),
              SizedBox(height: 30),
              Text('Username', style: AppTexts.smallHeading),
              SizedBox(height: 8),
              TextFieldWidget(
                inputFormatters: [
                  PreventStartingSpaceInputFormatter(),
                ],
                controller: _username,
                hintText: 'Username*',
                fillColor: Colors.white,
              ),
              SizedBox(height: 20),
              Text('Email', style: AppTexts.smallHeading),
              SizedBox(height: 8),
              TextFieldWidget(
                textColor: AppColors.gray400,
                readOnly: true,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                controller: _email,
                hintText: 'Email*',
                fillColor: Colors.white,
              ),
              SizedBox(height: 20),
              Text('Phone', style: AppTexts.smallHeading),
              SizedBox(height: 8),
              TextFieldWidget(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                controller: _phone,
                hintText: 'Phone number*',
                fillColor: Colors.white,
              ),
              SizedBox(height: 50),
              MainAppButton(
                onPressed: isButtonEnabled ? () {} : null,
                text: 'Save',
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
