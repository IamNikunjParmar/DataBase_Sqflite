import 'package:cubit_api_calling_product/modal/cart_modal.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartDbHelper {
  CartDbHelper._();
  static final CartDbHelper cartDbHelper = CartDbHelper._();

  static const String cartBoxName = 'CartBox';

  Future<void> addToCart(CartModal product) async {
    final box = await Hive.openBox<CartModal>(cartBoxName);
    await box.put(product.id, product);
  }

  Future<List<CartModal>> getCartProduct() async {
    final box = await Hive.openBox<CartModal>(cartBoxName);
    return box.values.toList();
  }

  Future<void> removeCartProduct(int productId) async {
    final box = await Hive.openBox<CartModal>(cartBoxName);
    await box.delete(productId);
  }
}
