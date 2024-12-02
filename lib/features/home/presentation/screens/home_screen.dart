import 'package:fintech/core/app_constants/size_manager.dart';
import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:fintech/features/home/presentation/widgets/desktop_layout.dart';
import 'package:fintech/features/home/presentation/widgets/mobile_layout.dart';
import 'package:fintech/shared_widgets/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadJsonData(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: SizeManager.width(context) < SizeManager.tablet ? const HomeAppbar() : null,
        bottomNavigationBar:
            SizeManager.width(context) < SizeManager.tablet ? const CustomBottomNavBar() : null,
        body: SizeManager.width(context) < SizeManager.tablet
            ? const MobileLayout()
            : const DesktopLayout(),
      ),
    );
  }
}
