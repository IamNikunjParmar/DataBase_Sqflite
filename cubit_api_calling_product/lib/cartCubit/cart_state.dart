part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartModal> products;
  CartLoaded({required this.products});

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
