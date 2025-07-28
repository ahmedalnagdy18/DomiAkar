import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/user_data_cubit/user_data_state.dart';
import 'package:domi_aqar/features/home/presentation/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        final userData = context.read<UserDataCubit>().userData;
        return Scaffold(
          backgroundColor: AppColors.grayTrue100,
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
                            appbarIcon(
                                icon: Icons.notifications_active_outlined),
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
                  //! Recommended
                  SizedBox(height: 26),
                  RecommendedWidget(),
                  //! Nearby
                  SizedBox(height: 26),
                  NearbyWidget(),
                  //! Top Locations
                  SizedBox(height: 20),
                  TopLocationWidget(),
                  //! Popular for you
                  SizedBox(height: 28),
                  PopularWidget(),
                  SizedBox(height: 22),
                ],
              ),
            ),
          ),
        );
      },
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
