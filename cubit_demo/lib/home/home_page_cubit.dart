import 'package:bloc/bloc.dart';
import 'package:cubit_demo/home/home_page_state.dart';
import 'package:cubit_demo/helper/api_helper.dart';

class HomePageCubit extends Cubit<HomeState> {
  final ApiHelper apiHelper = ApiHelper.apiHelper;
  HomePageCubit() : super(const HomeState());

  Future<void> onLoadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final newList = await apiHelper.getData();
      emit(state.copyWith(isLoading: false, userList: newList));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
