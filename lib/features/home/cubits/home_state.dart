part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeHomeTabState extends HomeState {}

final class LoadJsonDataLoadingState extends HomeState {}

final class LoadJsonDataSuccessState extends HomeState {
  final List<OrderModel> orders;

  LoadJsonDataSuccessState({required this.orders});
}

final class LoadJsonDataErrorState extends HomeState {
  final String error;

  LoadJsonDataErrorState({required this.error});
}
