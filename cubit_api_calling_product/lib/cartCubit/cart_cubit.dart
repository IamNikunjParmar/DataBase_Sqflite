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
    await box.put(product.id, product);
    final products = await cartDbHelper.getCartProduct();
    final updatePrice = product.price += product.price;
    emit(CartLoaded(products: products, quantity: product.quntitey += 1, totalPrice: updatePrice));

    print("IncrementQuantity :${product.quntitey} ");

    print("IncrementQuantityPrice :$updatePrice ");
  }

  // Quantity Decrement Product
  Future<void> decrementQuantity(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    await box.put(product.id, product);

    //  print("DecrementUpdatePrice :$updatePrice ");
    if (product.quntitey > 1) {
      final products = await cartDbHelper.getCartProduct();
      final singlePrice = (product.price / product.quntitey);
      final updatePrice = product.price = singlePrice * (product.quntitey - 1);
      emit(CartLoaded(products: products, quantity: product.quntitey -= 1, totalPrice: updatePrice));

      print("DecrementUpdatePrice :$updatePrice ");
    } else {
      await box.delete(product.id);
      final products = await cartDbHelper.getCartProduct();
      emit(CartLoaded(products: products));
    }
    print("DecrementQuantity :${product.quntitey} ");
  }

  totalCartProduct(int id, CartModal product) async {
    final box = Hive.box<CartModal>(cartBoxName);
    await box.put(product.id, product);
    final products = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: products, totalPrice: product.totalPrice));

    print("ProductPrice : ${product.price}----+++");

    // print("Total Price : $totalSum-+++++++++++++++++++++++++++++++++");
  }
}
