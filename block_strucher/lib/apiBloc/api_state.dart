import 'package:block_strucher/model/api_model.dart';
import 'package:block_strucher/utils/enum/api_enum.dart';
import 'package:equatable/equatable.dart';

class ApiState extends Equatable {
  final ApiStatus apiStatus;
  final List<ApiModel> userList;

  const ApiState({this.apiStatus = ApiStatus.loading, this.userList = const <ApiModel>[]});

  ApiState copyWith({ApiStatus? apiStatus, List<ApiModel>? userList}) {
    return ApiState(
      apiStatus: apiStatus ?? this.apiStatus,
      userList: userList ?? this.userList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [apiStatus, userList];
}
