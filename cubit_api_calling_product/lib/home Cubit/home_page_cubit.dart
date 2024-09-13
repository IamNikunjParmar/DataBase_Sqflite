import 'package:bloc/bloc.dart';
import 'package:cubit_api_calling_product/helper/api_helper.dart';
import 'package:cubit_api_calling_product/helper/db_helper.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ApiHelper apiHelper = ApiHelper.apiHelper;
  List<ProductModal> newAllProduct = [];
  List<ProductModal> cartListItem = [];

  HomePageCubit() : super(HomePageInitial());

  // getAllProduct
  Future<void> getAllProduct() async {
    emit(HomePageLoading());
    try {
      newAllProduct = await apiHelper.getProduct() ?? [];
      final beautyProduct = newAllProduct.where((product) => product.category == 'beauty').toList();
      emit(HomePageLoaded(
        allProduct: newAllProduct,
        selectedCategory: 'beauty',
        filterProduct: beautyProduct.isNotEmpty ? beautyProduct : newAllProduct,
      ));
    } catch (e) {
      emit(HomePageError(msg: e.toString()));
    }
  }

  // selected Category
  Future<void> setSelectedCategory(String category) async {
    final filtered = newAllProduct.where((product) => product.category == category).toList();

    emit(HomePageLoaded(
      filterProduct: filtered,
      selectedCategory: category,
      allProduct: newAllProduct,
    ));
    print("$category==============================");
    print("$filtered==============================");
  }

// Search Category and title
  void onSearchAllFiled(String query) {
    if (query.isEmpty) {
      final beautyProduct = newAllProduct.where((product) => product.category == 'beauty').toList();
      emit(
        HomePageLoaded(
          filterProduct: state is HomePageLoaded ? beautyProduct : newAllProduct,
          allProduct: newAllProduct,
          selectedCategory: 'beauty',
        ),
      );
    } else {
      final filtered = newAllProduct
          .where((product) =>
              product.title.toLowerCase().startsWith(query.toLowerCase()) ||
              product.category.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      emit(HomePageLoaded(
        filterProduct: filtered,
        allProduct: newAllProduct,
        selectedCategory: null,
      ));
      // print("category: $category+++++++++++++++++++");
    }
    print("query : $query+++++++++++++++++++");
  }
}
