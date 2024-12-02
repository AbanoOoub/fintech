import 'dart:developer';

import 'package:fintech/core/app_constants/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../shared_widgets/custom_text.dart';

class OrderInsightContainer extends StatelessWidget {
  const OrderInsightContainer({super.key, required this.title, required this.number});

  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.hintColor.withOpacity(0.3),
            blurRadius: 3,
            spreadRadius: 0.2,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextWidget(
            text: title,
            textStyle: AppTextTheme.subHeadingLarge(context),
            textAlign: TextAlign.center,
          ),
          CustomTextWidget(text: number),
        ],
      ),
    );
  }
}
