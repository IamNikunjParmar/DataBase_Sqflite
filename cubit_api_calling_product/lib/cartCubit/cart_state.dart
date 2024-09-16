part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartModal> products;
  final int? quantity;
  final double? totalPrice;
  CartLoaded({required this.products, this.quantity, this.totalPrice});

  // TODO: implement props
  List<Object?> get props => [products, quantity, totalPrice];
}

class UpdateCartProduct extends CartState {
  final CartModal products;
  final int? quantity;
  final double? totalPrice;
  UpdateCartProduct({required this.products, this.quantity, this.totalPrice});

  // TODO: implement props
  List<Object?> get props => [products, quantity, totalPrice];
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
