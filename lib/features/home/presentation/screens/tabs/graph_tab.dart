import 'package:fintech/core/utils/app_colors.dart';
import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GraphTab extends StatelessWidget {
  const GraphTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Center(
          child: AspectRatio(
            aspectRatio: 0.5.w,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: context.read<HomeCubit>().getLineChartSpots(),
                    color: AppColors.mainColor,
                    barWidth: 3.w,
                    isCurved: true,
                    preventCurveOverShooting: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
