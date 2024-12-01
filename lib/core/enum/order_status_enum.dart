import 'package:fintech/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

enum OrderStatus { ordered, delivered, returned }

class OrderStatusHelper {
  static OrderStatus getOrderStatus({required String status}) {
    switch (status) {
      case "ORDERED":
        return OrderStatus.ordered;
      case "DELIVERED":
        return OrderStatus.delivered;
      default:
        return OrderStatus.returned;
    }
  }

  static String getOrderStatusName({required OrderStatus status}) {
    switch (status) {
      case OrderStatus.ordered:
        return "Ordered";
      case OrderStatus.delivered:
        return "Delivered";
      default:
        return "Returned";
    }
  }

  static Color getOrderStatusColor({required OrderStatus status}) {
    switch (status) {
      case OrderStatus.ordered:
        return AppColors.orderedStatusBgColor;
      case OrderStatus.delivered:
        return AppColors.deliveredStatusBgColor;
      case OrderStatus.returned:
        return AppColors.returnedStatusBgColor;
    }
  }

  static Color getOrderStatusTextColor({required OrderStatus status}) {
    switch (status) {
      case OrderStatus.ordered:
        return AppColors.orderedStatusTextColor;
      case OrderStatus.delivered:
        return AppColors.deliveredStatusTextColor;
      case OrderStatus.returned:
        return AppColors.returnedStatusTextColor;
    }
  }
}
