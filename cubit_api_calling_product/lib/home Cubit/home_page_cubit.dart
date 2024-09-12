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
          filterProduct: beautyProduct.isNotEmpty ? beautyProduct : newAllProduct,
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
        searchQuery: query,
      ));
    }
    print("$query+++++++++++++++++++");
  }

  //add Cart Product
  // Future<void> addTOCartProduct(CartModal product) async {
  //   await cartDbHelper.addToCart(product);
  //   final products = await cartDbHelper.getCartProduct();
  //   emit(HomePageLoaded(
  //     filterProduct: (state as HomePageLoaded).filterProduct,
  //     cartList: products,
  //     allProduct: newAllProduct,
  //     selectedCategory: (state as HomePageLoaded).selectedCategory,
  //   ));
  //   // if (state is HomePageLoaded) {
  //   //   List<ProductModal> newCartList = List.from((state as HomePageLoaded).cartList);
  //   //   newCartList.add(product);
  //   //   emit(
  //   //     HomePageLoaded(
  //   //       filterProduct: (state as HomePageLoaded).filterProduct,
  //   //       allProduct: newAllProduct,
  //   //       cartList: newCartList,
  //   //       selectedCategory: (state as HomePageLoaded).selectedCategory,
  //   //     ),
  //   //   );
  //   //
  //   //   print("${newCartList.length}----------------++++++++++++++++++++++++");
  //   // }
  // }
}
