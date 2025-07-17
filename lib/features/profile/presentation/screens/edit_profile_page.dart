import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/features/profile/presentation/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _username = TextEditingController();
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
              UploadImageWidget(),
              SizedBox(height: 30),
              Text('Username', style: AppTexts.smallHeading),
              SizedBox(height: 8),
              TextFieldWidget(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                controller: _username,
                hintText: 'Username*',
                fillColor: Colors.white,
              ),
              SizedBox(height: 20),
              Text('Email', style: AppTexts.smallHeading),
              SizedBox(height: 8),
              TextFieldWidget(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                controller: _username,
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
                controller: _username,
                hintText: 'Phone number*',
                fillColor: Colors.white,
              ),
              SizedBox(height: 50),
              MainAppButton(
                onPressed: () {},
                text: 'Sign Up',
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
