import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/features/profile/presentation/screens/edit_profile_page.dart';
import 'package:domi_aqar/features/profile/presentation/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              UploadImageWidget(
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ));
                },
              ),
              SizedBox(height: 12),
              Text(
                'Ahmed Alnagdy',
                style:
                    AppTexts.regularBody.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 2),
              Text(
                'brooklynsim@gmail.com',
                style: AppTexts.smallBody
                    .copyWith(color: AppColors.grayNeutral400),
              ),
              SizedBox(height: 50),
              Divider(
                color: AppColors.grayNeutral300,
              ),
              SizedBox(height: 30),
              _listTileWidget(
                icon: Icons.settings_outlined,
                title: 'Account',
                onTap: () {},
              ),
              _listTileWidget(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {},
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Text(
                  'Sign Out',
                  style:
                      AppTexts.regularBody.copyWith(color: AppColors.error400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _listTileWidget(
    {required IconData icon,
    required String title,
    required Function() onTap}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    trailing: const Icon(
      Icons.arrow_forward_ios_outlined,
      size: 20,
      color: AppColors.grayNeutral300,
    ),
    leading: Icon(
      icon,
      color: AppColors.primary700,
    ),
    title: Text(title),
    onTap: onTap,
  );
}
