import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_ecommerce_app/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(const WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddWishlistProduct>(_onAddWishlistProduct);
    on<RemoveWishlistProduct>(_onRemoveWishlistProduct);
  }

  void _onStartWishlist(
    StartWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {}
  }

  void _onAddWishlistProduct(
    AddWishlistProduct event,
    Emitter<WishlistState> emit,
  ) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onRemoveWishlistProduct(
    RemoveWishlistProduct event,
    Emitter<WishlistState> emit,
  ) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
