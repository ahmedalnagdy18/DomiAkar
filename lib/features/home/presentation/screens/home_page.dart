import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserDataModel? userData;
  @override
  void initState() {
    userData = context.read<UserDataCubit>().userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: AppTexts.regularBody
                              .copyWith(color: AppColors.grayNeutral400),
                        ),
                        Text(
                          userData?.username ?? "",
                          style: AppTexts.smallHeading,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        appbarIcon(icon: Icons.notifications_active_outlined),
                        SizedBox(width: 8),
                        appbarIcon(icon: Icons.chat_outlined),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/images/promo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: AppTexts.smallHeading,
                    ),
                    Text(
                      "See all",
                      style: AppTexts.smallBody
                          .copyWith(color: AppColors.primary700),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 170,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 165,
                          width: 225,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            'assets/images/house_model.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'New dametta',
                            style: AppTexts.meduimBody
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appbarIcon({required IconData icon}) {
  return Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.grayNeutral300),
    ),
    child: Icon(icon, size: 22),
  );
}
