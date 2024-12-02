import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../cubits/home_cubit.dart';
import 'order_insight_container.dart';

class OrderInsightsDesktopLayout extends StatelessWidget {
  const OrderInsightsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OrderInsightContainer(
                  title: 'Total orders',
                  number: context.read<HomeCubit>().getTotalOrders().toString()),
            ),
            10.horizontalSpace,
            Expanded(
              child: OrderInsightContainer(
                  title: 'Average price',
                  number: context.read<HomeCubit>().getAvgPrice().toString()),
            ),
          ],
        ),
        OrderInsightContainer(
            title: 'Number of returns',
            number: context.read<HomeCubit>().getNumOfReturns().toString()),
      ],
    );
  }
}
