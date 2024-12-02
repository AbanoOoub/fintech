import 'package:fintech/core/app_constants/size_manager.dart';
import 'package:fintech/features/home/cubits/home_cubit.dart';
import 'package:fintech/features/home/presentation/widgets/history_tab_widgets/order_insights_desktop_layout.dart';
import 'package:fintech/features/home/presentation/widgets/history_tab_widgets/order_insights_mobile_layout.dart';
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
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: SizeManager.width(context) < SizeManager.tablet ? 2.5 : 1.5,
                          child: SizeManager.width(context) < SizeManager.tablet
                              ? const OrderInsightsMobileLayout()
                              : const OrderInsightsDesktopLayout(),
                        ),
                        10.verticalSpace,
                        Expanded(
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
                  );
        ;
      },
    );
  }
}
