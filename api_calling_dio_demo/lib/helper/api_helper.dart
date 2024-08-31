import 'package:api_calling_dio_demo/modal/api_modal.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String dioApi = "https://wax-ablaze-chiller.glitch.me/texts/";

  //Object Create for Dio
  final dio = Dio();

  //Get API
  Future<List<ApiModal>> getData() async {
    Response response = await dio.get(dioApi);
    return (response.data as List).map((e) => ApiModal.fromJson(e)).toList();
  }

  // Post Api
  Future<ApiModal> postData(String content, String email) async {
    Response response = await dio.post(
      dioApi,
      data: {'content': content, 'email': email},
    );
    return ApiModal.fromJson(response.data);
  }

  //Put Api
  Future<ApiModal> putData(int id, {required String content, required String email}) async {
    Response response = await dio.put(
      "$dioApi/$id",
      data: {
        'content': content,
        "email": email,
      },
    );

    return ApiModal.fromJson(response.data);
  }

//Delete User
  Future<void> deleteData(int id) async {
    Response response = await dio.delete('$dioApi/$id');
  }
}
