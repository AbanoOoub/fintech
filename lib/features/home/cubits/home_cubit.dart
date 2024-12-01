import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int tabIndex = 0;

  void changeTab({required int newTabIndex}) {
    if (newTabIndex != tabIndex) {
      tabIndex = newTabIndex;
      emit(ChangeHomeTabState());
    }
  }
}
