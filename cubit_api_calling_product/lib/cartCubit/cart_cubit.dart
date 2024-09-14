import 'package:bloc/bloc.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../helper/db_helper.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static const String cartBoxName = 'CartBox';
  final CartDbHelper cartDbHelper = CartDbHelper.cartDbHelper;

  List<CartModal> allProduct = [];

  Future<void> getCartProduct() async {
    emit(CartLoading());

    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct));

    print("${allProduct.length}=-=============--------------------=");
  }

  // Initialize by loading products from the database
  Future<void> loadCartProducts() async {
    emit(CartLoading());
    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct));
  }

  Future<void> addToCart(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    await box.put(product.id, product);
    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct));
  }

  Future<void> incrementQuantity(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    product.quntitey += 1;
    product.totalPrice = product.price * product.quntitey;
    await box.put(product.id, product);
    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct, quantity: product.quntitey, totalPrice: product.totalPrice));
  }

  Future<void> decrementQuantity(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    if (product.quntitey > 1) {
      product.quntitey -= 1;
      product.totalPrice = product.price * product.quntitey;
      await box.put(product.id, product);
    } else {
      await box.delete(product.id);
    }
    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct, quantity: product.quntitey, totalPrice: product.totalPrice));
  }

  Future<void> removeProduct(int productId) async {
    await cartDbHelper.removeCartProduct(productId);
    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct));
  }
}
