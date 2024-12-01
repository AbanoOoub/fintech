import 'package:fintech/config/themes/app_text_theme.dart';
import 'package:fintech/core/utils/app_colors.dart';
import 'package:fintech/shared_widgets/custom_text_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.onTapReloadPage, this.error});

  final void Function() onTapReloadPage;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: AppColors.error,
            size: 60.w,
          ),
          20.verticalSpace,
          CustomTextWidget(text: 'Oh uh', textStyle: AppTextTheme.headingLarge),
          10.verticalSpace,
          CustomTextWidget(
            text: error ?? 'Something went wrong!',
            textAlign: TextAlign.center,
            textStyle: AppTextTheme.bodyLarge,
          ),
          30.verticalSpace,
          CustomTextButtonWidget(
            btnWidth: 200.w,
            btnHeight: 40.w,
            text: 'Reload',
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
            ),
            textStyle: AppTextTheme.bodyMedium.copyWith(color: AppColors.white),
            onPressed: onTapReloadPage,
          ),
        ],
      ),
    );
  }
}
