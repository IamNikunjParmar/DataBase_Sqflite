import 'package:block_strucher/apiBloc/api_event.dart';
import 'package:block_strucher/apiBloc/api_state.dart';
import 'package:block_strucher/repo/data_repo.dart';
import 'package:block_strucher/utils/enum/api_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  GetDataRepo getDataRepo = GetDataRepo();

  ApiBloc() : super(const ApiState()) {
    on<FetchApi>(_getApiData);
  }

  Future<void> _getApiData(FetchApi event, Emitter<ApiState> emit) async {
    await getDataRepo.getData().then(
      (value) {
        emit(state.copyWith(apiStatus: ApiStatus.success, userList: value));
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(apiStatus: ApiStatus.error));
      },
    );
  }
}
