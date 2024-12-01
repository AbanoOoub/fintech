import 'package:fintech/core/utils/app_colors.dart';
import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:fintech/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadJsonData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: const HomeAppbar(),
            body: context.read<HomeCubit>().tabs[context.read<HomeCubit>().tabIndex],
            bottomNavigationBar: const CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}
