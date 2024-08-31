import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String dynamicApi = 'http://medical-arch.com/api/ecall/dynamic/advance';

  final dio = Dio();

  Future<Map<String, dynamic>> getData() async {
    Response response = await dio.get(dynamicApi);
    print("============$response ==================");
    return response.data as Map<String, dynamic>;
  }
}
