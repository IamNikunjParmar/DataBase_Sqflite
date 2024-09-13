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
  Future<void> addToCart(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    await box.put(product.id, product);
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products));
  }

  Future<void> getCartProduct() async {
    emit(CartLoading());
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products));

    print("${products.length}=-=============--------------------=");
  }

  Future<void> removeProduct(int productId) async {
    await cartDbHelper.removeCartProduct(productId);
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products));

    // print("${products.length}++++++++++++++++++++++++++++++++++++++++++++----=");
  }

// Quantity Increment Product
  Future<void> incrementQuantity(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    product.quntitey += 1;
    product.totalPrice = product.price * product.quntitey;
    await box.put(product.id, product);
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products, quantity: product.quntitey, totalPrice: product.totalPrice));

    print("IncrementQuantity :${product.quntitey} ");
    print("IncrementQuantityPrice :${product.totalPrice} ");
  }

  // Quantity Decrement Product
  Future<void> decrementQuantity(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);

    if (product.quntitey > 1) {
      product.quntitey -= 1;
      product.totalPrice = product.price * product.quntitey;
      await box.put(product.id, product);
      final products = await cartDbHelper.getCartProduct();
      emit(CartLoaded(products: products, quantity: product.quntitey, totalPrice: product.totalPrice));
      print("DecrementUpdatePrice :${product.totalPrice} ");
    } else {
      await box.delete(product.id);
      final products = await cartDbHelper.getCartProduct();
      emit(CartLoaded(products: products));
    }
    print("DecrementQuantity :${product.quntitey} ");
  }

  //total price
  totalCartProduct(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    await box.put(product.id, product);
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products, totalPrice: product.totalPrice));

    print("ProductPrice : ${product.totalPrice}----+++");

    // print("Total Price : $totalSum-+++++++++++++++++++++++++++++++++");
  }
}
