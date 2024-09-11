import 'package:bloc/bloc.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../helper/db_helper.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartDbHelper cartDbHelper = CartDbHelper.cartDbHelper;
  CartCubit() : super(CartInitial());

  Future<void> addCartProduct(CartModal product) async {
    await cartDbHelper.addToCart(product);
    final newProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: newProduct));

    print("${newProduct.length}=-=============--------------------=");
  }

  Future<void> getCartProduct() async {
    emit(CartLoading());
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products));

    print("${products.length}=-=============--------------------=");
  }

  Future<void> removeProduct(int productId) async {
    emit(CartLoading());
    await cartDbHelper.removeCartProduct(productId);
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products));

    // print("${products.length}++++++++++++++++++++++++++++++++++++++++++++----=");
  }
}
