part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WishlistEvent {
    const StartWishlist();

  @override
  List<Object> get props => [];
}

class AddWishlistProduct extends WishlistEvent {
  const AddWishlistProduct({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvent {
  const RemoveWishlistProduct({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}
