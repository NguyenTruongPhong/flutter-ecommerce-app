part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartProductStarted extends CartEvent {
  const CartProductStarted();
  
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  const CartProductAdded({required this.product});
  final Product product;

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  const CartProductRemoved({required this.product});
  final Product product;

  @override
  List<Object> get props => [product];
}
