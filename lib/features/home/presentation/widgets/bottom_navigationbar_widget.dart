import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final dynamic Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return CustomLineIndicatorBottomNavbar(
      unselectedIconSize: 20,
      selectedIconSize: 20,
      selectedColor: AppColors.primary700,
      unSelectedColor: AppColors.gray400,
      backgroundColor: AppColors.gray50,
      enableLineIndicator: true,
      lineIndicatorWidth: 2,
      indicatorType: IndicatorType.top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'home',
          icon: Icons.home_max_outlined,
          isAssetsImage: false,
        ),
        CustomBottomBarItems(
          label: 'explore',
          icon: Icons.explore_outlined,
          isAssetsImage: false,
        ),
        CustomBottomBarItems(
          icon: Icons.favorite_outline,
          label: 'Favorite',
          isAssetsImage: false,
        ),
        CustomBottomBarItems(
          isAssetsImage: false,
          label: 'My Booking',
          icon: Icons.article_outlined,
        ),
        CustomBottomBarItems(
          isAssetsImage: false,
          label: 'Profile',
          icon: Icons.person_3,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
