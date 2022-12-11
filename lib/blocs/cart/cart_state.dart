part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartProductLoading extends CartState {
  const CartProductLoading();

  @override
  List<Object> get props => [];
}

class CartProductLoaded extends CartState {
  const CartProductLoaded({required this.cart});

  final Cart cart;

  @override
  List<Object> get props => [cart];
}

class CartProductError extends CartState {
  const CartProductError();

  @override
  List<Object> get props => [];
}
