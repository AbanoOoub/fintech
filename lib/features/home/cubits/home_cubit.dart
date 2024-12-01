import 'dart:convert';
import 'dart:developer';
import 'package:fintech/core/enum/order_status_enum.dart';
import 'package:fintech/features/home/data/models/order_model.dart';
import 'package:fintech/features/home/presentation/screens/tabs/graph_tab.dart';
import 'package:fintech/features/home/presentation/screens/tabs/history_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int tabIndex = 0;
  List<OrderModel> orders = [];

  List<Widget> tabs = const [
    HistoryTab(),
    GraphTab(),
  ];

  List<String> tabsTitle = const [
    'Orders',
    'Statistics',
  ];

  void changeTab({required int newTabIndex}) {
    if (newTabIndex != tabIndex) {
      tabIndex = newTabIndex;
      emit(ChangeHomeTabState());
    }
  }

  Future<List<OrderModel>> loadJsonFromAssets() async {
    final String jsonString = await rootBundle.loadString('assets/json/orders.json');
    final ordersJson = jsonDecode(jsonString);
    List<OrderModel> orders = [];
    for (var order in ordersJson) {
      orders.add(OrderModel.fromJson(order));
    }
    return orders;
  }

  Future<void> loadJsonData() async {
    emit(LoadJsonDataLoadingState());
    try {
      orders = await loadJsonFromAssets();

      emit(LoadJsonDataSuccessState(orders: orders));
    } catch (e) {
      emit(LoadJsonDataErrorState(error: e.toString()));
    }
  }

  String getTotalOrders() {
    return (orders.length).toString();
  }

  String getAvgPrice() {
    double sum = 0;

    for (var order in orders) {
      String price = order.price.replaceAll(RegExp(r"\$|,"), '');
      log(price);
      sum += double.parse(price);
    }
    return '\$${(sum / orders.length).toStringAsFixed(2)}';
  }

  String getNumOfReturns() {
    return orders.where((element) => element.status == OrderStatus.returned).length.toString();
  }
}
