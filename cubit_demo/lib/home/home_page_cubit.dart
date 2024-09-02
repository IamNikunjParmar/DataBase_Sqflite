import 'package:bloc/bloc.dart';
import 'package:cubit_demo/Cubit/home_page_state.dart';
import 'package:cubit_demo/helper/api_helper.dart';
import 'package:meta/meta.dart';

class HomePageCubit extends Cubit<HomeState> {
  final ApiHelper apiHelper = ApiHelper.apiHelper;
  HomePageCubit() : super(const HomeState());

  onLoadData() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    try {
      await apiHelper.getData();
      emit(state.copyWith(apiStatus: ApiStatus.success));
    } catch (e) {
      emit(state.copyWith(apiStatus: ApiStatus.error));
    }
  }
}
