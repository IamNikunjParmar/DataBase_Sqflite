import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

import '../modal/product_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  List<ProductModal> products = [];
  String productApi = "https://dummyjson.com/products";

  final dio = Dio();

  Future<List<ProductModal>> getProduct() async {
    Response response = await dio.get(productApi);
    List allProducts = response.data['products'];
    List<ProductModal> products = allProducts
        .map(
          (e) => ProductModal.fromJson(e),
        )
        .toList();

    print("$products");

    return products;
  }
}
