import 'package:block_strucher/model/api_model.dart';
import 'package:dio/dio.dart';

class GetDataRepo {
  final dio = Dio();
  String dioApi = "https://wax-ablaze-chiller.glitch.me/texts/";

  Future<List<ApiModel>> getData() async {
    Response response = await dio.get(dioApi);

    return (response.data as List).map((e) => ApiModel.fromJson(e)).toList();
  }
}
