import 'package:bloc/bloc.dart';
import 'package:cubit_api_calling_product/helper/api_helper.dart';
import 'package:cubit_api_calling_product/modal/product_modal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  List<ProductModal> newAllProduct = [];
  final ApiHelper apiHelper = ApiHelper.apiHelper;

  HomePageCubit() : super(HomePageInitial());

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

  void onSearchAllFiled(String query) {
    if (query.isEmpty) {
      emit(
        HomePageLoaded(
          filterProduct: newAllProduct,
          allProduct: newAllProduct,
          selectedCategory: null,
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
}
