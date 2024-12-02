import 'package:fintech/core/app_constants/size_manager.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';

class AppTextTheme {
  static TextStyle headingLarge(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        color: AppColors.textColor,
      );

  static TextStyle headingMedium(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: AppColors.textColor,
      );

  static TextStyle headingSmall(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        color: AppColors.textColor,
      );

  static TextStyle subHeadingLarge(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        color: AppColors.textColor,
      );

  static TextStyle subHeadingMedium(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        color: AppColors.textColor,
      );

  static TextStyle subHeadingSmall(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        color: AppColors.textColor,
      );

  static TextStyle bodyLarge(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        color: AppColors.textColor,
      );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        color: AppColors.textColor,
      );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        color: AppColors.textColor,
      );
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  // this ratios I declared
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeManager.tablet) {
    return width / 550;
  } else if (width < SizeManager.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
