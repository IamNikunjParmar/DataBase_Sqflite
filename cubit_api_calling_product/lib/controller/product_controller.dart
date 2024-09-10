import 'package:cubit_api_calling_product/helper/api_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

import '../modal/product_modal.dart';

class ProductController extends ChangeNotifier {
  List<ProductModal> allProducts = [];

  String? _selectedCategory = 'beauty';

  String? get selectedCategory => _selectedCategory;

  ProductController() {
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    allProducts = await ApiHelper.apiHelper.getProduct() ?? [];
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<ProductModal> get selectedProducts {
    if (_selectedCategory == null) {
      return [];
    }
    return allProducts.where((product) => product.category == _selectedCategory).toList();
  }
}
