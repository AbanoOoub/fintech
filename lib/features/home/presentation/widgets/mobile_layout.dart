import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:fintech/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import 'home_appbar.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return context.read<HomeCubit>().tabs[context.read<HomeCubit>().tabIndex];
      },
    );
  }
}
