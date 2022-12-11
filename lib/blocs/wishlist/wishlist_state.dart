part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {
  const WishlistLoading();

  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  const WishlistLoaded({this.wishlist = const Wishlist()});

  final Wishlist wishlist;

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {}
