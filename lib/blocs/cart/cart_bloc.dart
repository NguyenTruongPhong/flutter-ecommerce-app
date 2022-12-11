import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/cart_model.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartProductLoading()) {
    on<CartProductStarted>(_onCartProductStarted);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductRemoved>(_onCartProductRemoved);
  }

  void _onCartProductStarted(
    CartProductStarted event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartProductLoading());

    try {
      Future.delayed(const Duration(seconds: 1));
      emit(const CartProductLoaded(cart: Cart()));
    } catch (_) {}
  }

  void _onCartProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;

    try {
      if (state is CartProductLoaded) {
        emit(
          CartProductLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      }
    } catch (_) {}
  }

  void _onCartProductRemoved(
    CartProductRemoved event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;

    try {
      if (state is CartProductLoaded) {
        emit(
          CartProductLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      }
    } catch (_) {}
  }
}
