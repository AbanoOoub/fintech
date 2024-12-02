import 'package:fintech/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home_cubit.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: context.read<HomeCubit>().tabs[0],
            ),
            Expanded(
              child: context.read<HomeCubit>().tabs[1],
            ),
          ],
        );
      },
    );
  }
}
