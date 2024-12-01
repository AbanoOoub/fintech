import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:fintech/features/home/presentation/widgets/history_tab_widgets/order_insight_container.dart';
import 'package:fintech/shared_widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/history_tab_widgets/order.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is LoadJsonDataErrorState
            ? CustomErrorWidget(
                onTapReloadPage: () => context.read<HomeCubit>().loadJsonData(),
              )
            : state is LoadJsonDataLoadingState
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Padding(
                    padding: EdgeInsets.all(15.w),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
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
                              10.horizontalSpace,
                              Expanded(
                                child: OrderInsightContainer(
                                    title: 'Number of returns',
                                    number: context.read<HomeCubit>().getNumOfReturns().toString()),
                              ),
                              10.horizontalSpace,
                            ],
                          ),
                          10.verticalSpace,
                          AspectRatio(
                            aspectRatio: 0.5.w,
                            child: ListView.separated(
                              itemCount: context.read<HomeCubit>().orders.length,
                              itemBuilder: (context, index) {
                                return Order(
                                  buyer: context.read<HomeCubit>().orders[index].buyer,
                                  company: context.read<HomeCubit>().orders[index].company,
                                  isActive: context.read<HomeCubit>().orders[index].isActive,
                                  picture: context.read<HomeCubit>().orders[index].picture,
                                  price: context.read<HomeCubit>().orders[index].price,
                                  status: context.read<HomeCubit>().orders[index].status,
                                );
                              },
                              separatorBuilder: (context, index) => 10.verticalSpace,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}
