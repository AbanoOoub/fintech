import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/themes/app_text_theme.dart';
import '../../../../core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: AppColors.white,
          elevation: 1,
          onTap: (value) {
            context.read<HomeCubit>().changeTab(newTabIndex: value);
          },
          currentIndex: context.read<HomeCubit>().tabIndex,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.hintColor,
          selectedLabelStyle: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.mainColor),
          unselectedLabelStyle:
              AppTextTheme.bodySmall(context).copyWith(color: AppColors.hintColor),
          unselectedIconTheme: IconThemeData(size: 20.w),
          selectedIconTheme: IconThemeData(size: 24.w),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.line_axis_rounded), label: 'Graph'),
          ],
        );
      },
    );
  }
}
