import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/app_text_theme.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../shared_widgets/custom_text.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AppBar(
          centerTitle: false,
          backgroundColor: AppColors.white,
          title: CustomTextWidget(
            text: context.read<HomeCubit>().tabsTitle[context.read<HomeCubit>().tabIndex],
            textStyle: AppTextTheme.headingLarge,
            textColor: AppColors.mainColor,
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
