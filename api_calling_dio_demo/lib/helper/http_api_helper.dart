import 'dart:convert';

import 'package:api_calling_dio_demo/modal/api_modal.dart';
import 'package:http/http.dart' as http;

class HttpApiHelper {
  HttpApiHelper._();

  static final HttpApiHelper httpApiHelper = HttpApiHelper._();

  String httpApi = "https://wax-ablaze-chiller.glitch.me/texts/";

  Future<List<ApiModal>> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(httpApi));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        print('$data');
        return data
            .map(
              (e) => ApiModal.fromJson(e),
            )
            .toList();
      } else {
        throw Exception('failed Data');
      }
    } catch (e) {
      print('ERROR:=============================$e');
      throw e;
    }
  }
}
