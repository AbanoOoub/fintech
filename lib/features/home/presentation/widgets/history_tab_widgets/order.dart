import 'package:fintech/config/themes/app_text_theme.dart';
import 'package:fintech/core/enum/order_status_enum.dart';
import 'package:fintech/core/utils/app_colors.dart';
import 'package:fintech/shared_widgets/custom_network_image.dart';
import 'package:fintech/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Order extends StatelessWidget {
  const Order(
      {super.key,
      required this.buyer,
      required this.isActive,
      required this.company,
      required this.picture,
      required this.price,
      required this.status});

  final String buyer;
  final bool isActive;
  final String company;
  final String picture;
  final String price;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(vertical: 5.w, horizontal: 1.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isActive ? AppColors.green : AppColors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.withOpacity(0.3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: picture,
                height: 45.w,
                width: 45.w,
                radius: 8.w,
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: buyer,
                      textStyle: AppTextTheme.headingSmall,
                    ),
                    5.verticalSpace,
                    CustomTextWidget(text: company),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: OrderStatusHelper.getOrderStatusColor(status: status),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: CustomTextWidget(
                      text: OrderStatusHelper.getOrderStatusName(status: status),
                      textColor: OrderStatusHelper.getOrderStatusTextColor(status: status),
                    ),
                  ),
                  5.verticalSpace,
                  isActive
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.green,
                              radius: 3.r,
                            ),
                            5.horizontalSpace,
                            const CustomTextWidget(text: 'Active'),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.red,
                              radius: 3.r,
                            ),
                            5.horizontalSpace,
                            const CustomTextWidget(text: 'Not active'),
                          ],
                        ),
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: 'Total:',
                textStyle: AppTextTheme.headingMedium,
              ),
              5.horizontalSpace,
              CustomTextWidget(
                text: price,
                textStyle: AppTextTheme.headingMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
