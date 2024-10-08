import 'package:bloc/bloc.dart';
import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:cubit_api_calling_product/modal/product_modal.dart';
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
  final box = Hive.box<CartModal>(cartBoxName);

  Future<void> getCartProduct() async {
    emit(CartLoading());
    allProduct = await cartDbHelper.getCartProduct();
    emit(CartLoaded(products: allProduct));
    print("${allProduct.length}=-=============--------------------=");
  }

  Future<void> addToCart(ProductModal product) async {
    CartModal newProduct = CartModal(
      id: product.id,
      title: product.title,
      thumbnail: product.thumbnail,
      price: product.price,
      quntitey: 1,
      totalPrice: product.price,
    );
    await box.put(product.id, newProduct);
    emit(UpdateCartProduct(products: newProduct));
  }

  Future<void> removeProduct(int productId) async {
    await box.delete(productId);
    allProduct.removeWhere((element) => element.id == productId);
    emit(CartLoaded(products: allProduct));
  }

  Future<void> incrementProductQuantity(CartModal cartItem) async {
    cartItem.quntitey += 1;
    cartItem.totalPrice = cartItem.price * cartItem.quntitey;
    await box.put(cartItem.id, cartItem);
    var index = allProduct.indexWhere((element) => element.id == cartItem.id);
    if (index != -1) {
      allProduct[index] = cartItem;
    }
    emit(CartLoaded(products: allProduct, quantity: cartItem.quntitey, totalPrice: cartItem.totalPrice));
    print("IncrementMethod : ${cartItem.totalPrice}");
  }

  Future<void> decrementProductQuantity(CartModal cartItem) async {
    if (cartItem.quntitey > 1) {
      cartItem.quntitey -= 1;
      cartItem.totalPrice = cartItem.price * cartItem.quntitey;
      await box.put(cartItem.id, cartItem);
    } else {
      await box.delete(cartItem.id);
      allProduct.removeWhere((element) => element.id == cartItem.id);
    }

    emit(CartLoaded(products: allProduct, totalPrice: cartItem.totalPrice, quantity: cartItem.quntitey));
    print("DecrementMethod : ${cartItem.totalPrice}");
  }

  Stream<BoxEvent> watchCart() {
    return box.watch();
  }
}
