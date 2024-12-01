import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';

class AppTextTheme {
  static TextStyle get headingLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
        color: AppColors.textColor,
      );

  static TextStyle get headingMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        color: AppColors.textColor,
      );

  static TextStyle get headingSmall => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: AppColors.textColor,
      );

  static TextStyle get subHeadingLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: AppColors.textColor,
      );

  static TextStyle get subHeadingMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        color: AppColors.textColor,
      );

  static TextStyle get subHeadingSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: AppColors.textColor,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: AppColors.textColor,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        color: AppColors.textColor,
      );

  static TextStyle get bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10.sp,
        color: AppColors.textColor,
      );
}
