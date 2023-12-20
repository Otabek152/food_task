import 'package:flutter/material.dart';
import 'package:food_task/ui/theme/app_colors.dart';

abstract class AppStyle {
  static TextStyle fontHeader = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.lightBlue,
  );
    static TextStyle fontText = TextStyle(
    fontSize: 12,
    color: AppColors.grey,
  );
}