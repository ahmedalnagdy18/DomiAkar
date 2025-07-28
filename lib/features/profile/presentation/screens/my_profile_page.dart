import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/inkweel_widget.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/user_data_cubit/user_data_state.dart';
import 'package:domi_aqar/features/profile/presentation/screens/edit_profile_page.dart';
import 'package:domi_aqar/features/profile/presentation/widgets/logout_dailoge_widget.dart';
import 'package:domi_aqar/features/profile/presentation/widgets/upload_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: 'Profile'),
          body: state is SuccessUserData
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        UploadImageWidget(
                          userData: state.userData,
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
                          state.userData.username,
                          style: AppTexts.regularBody
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 2),
                        Text(
                          state.userData.email,
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
                        InkwellWidget(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) => LogoutDailogeWidget());
                          },
                          child: Text(
                            'Sign Out',
                            style: AppTexts.regularBody
                                .copyWith(color: AppColors.error400),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        );
      },
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
