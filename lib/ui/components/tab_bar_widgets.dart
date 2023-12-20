import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_task/ui/resources/app_icon.dart';
import 'package:food_task/ui/theme/app_colors.dart';

class TabBarWidgets extends StatelessWidget {
  const TabBarWidgets({
    super.key,
    required this.screens,
  });

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        border: null,
        backgroundColor: Colors.white,
        activeColor: AppColors.green,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcon.home,
              color: AppColors.green,
            ),
            icon: SvgPicture.asset(
              AppIcon.home,
              color: AppColors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcon.edit,
              color: AppColors.green,
            ),
            icon: SvgPicture.asset(AppIcon.edit),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcon.scan,
              color: AppColors.green,
            ),
            icon: SvgPicture.asset(AppIcon.scan),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcon.notification,
              color: AppColors.green,
            ),
            icon: SvgPicture.asset(AppIcon.notification),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcon.profile,
              color: AppColors.green,
            ),
            icon: SvgPicture.asset(AppIcon.profile),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return screens[index];
          },
        );
      },
    );
  }
}
