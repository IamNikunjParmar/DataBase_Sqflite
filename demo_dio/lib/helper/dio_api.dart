import 'package:demo_dio/modal/weather_modal.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String dioApi = "https://wax-ablaze-chiller.glitch.me/texts/";

  final dio = Dio();

  Future<List<WeatherModel>> getData() async {
    Response response = await dio.get(dioApi);
    return (response.data as List)
        .map((e) => WeatherModel.fromJson(e))
        .toList();
  }

  Future<void> deleteData(int id) async {
    Response response = await dio.delete('$dioApi/$id');
  }
}
