part of 'home_page_cubit.dart';

@immutable
class HomePageState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class HomePageLoaded extends HomePageState {
  final List<ProductModal> allProduct;
  final String? selectedCategory;
  final List<ProductModal> filterProduct;
  final String searchQuery;
  final List<ProductModal> cartList;

  HomePageLoaded({
    this.allProduct = const <ProductModal>[],
    this.selectedCategory = '',
    required this.filterProduct,
    this.searchQuery = '',
    this.cartList = const <ProductModal>[],
  });

  HomePageLoaded copyWith({
    List<ProductModal>? allProduct,
    String? selectedCategory,
    List<ProductModal>? filterProduct,
    String? searchQuery,
    List<ProductModal>? cartList,
  }) {
    return HomePageLoaded(
      allProduct: allProduct ?? this.allProduct,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filterProduct: filterProduct ?? this.filterProduct,
      searchQuery: searchQuery ?? this.searchQuery,
      cartList: cartList ?? this.cartList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [allProduct, selectedCategory, filterProduct, searchQuery, cartList];
}

final class HomePageError extends HomePageState {
  final String msg;

  HomePageError({required this.msg});

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
