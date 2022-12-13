import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../blocs/checkout/checkout_bloc.dart';

import '../models/models.dart';

import '../screens/screens.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
    this.isWishlist,
  }) : super(key: key);

  final String screen;
  final Product? product;
  final bool? isWishlist;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(
            context,
            screen,
          )!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(BuildContext context, String screen) {
    switch (screen) {
      case '/home':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, isWishlist!, product!);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      default:
        return _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () =>
            Navigator.popUntil(context, ModalRoute.withName('/home')),
        icon: const Icon(Icons.home),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      IconButton(
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, '/cart', ModalRoute.withName('/home')),
        icon: const Icon(Icons.shopping_cart),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, '/person', ModalRoute.withName('/home')),
        icon: const Icon(Icons.person),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    ];
  }

  List<Widget> _buildAddToCartNavBar(
    BuildContext context,
    bool isWishlist,
    Product product,
  ) {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.share,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          isWishlist = state is WishlistLoaded &&
                  state.wishlist.products.contains(product)
              ? true
              : false;
          return IconButton(
            onPressed: () {
              var snackbar = const SnackBar(
                content: Text('Product was existing in your wishlist.'),
              );

              if (!isWishlist) {
                context
                    .read<WishlistBloc>()
                    .add(AddWishlistProduct(product: product));

                snackbar = const SnackBar(
                  content: Text('Added to your wishlist.'),
                );
              }

              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackbar);
            },
            icon: Icon(
              Icons.favorite,
              color: isWishlist
                  ? Theme.of(context).errorColor
                  : Theme.of(context).scaffoldBackgroundColor,
            ),
          );
        },
      ),
      ElevatedButton(
        onPressed: () {
          context.read<CartBloc>().add(CartProductAdded(product: product));
          Navigator.of(context).pushNamed(CartScreen.routeName);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Text(
          'ADD TO CART',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartProductLoaded) {
            bool isEmpty = state.cart.products.isEmpty;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isEmpty
                    ? Colors.grey
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {
                if (state.cart.products.isEmpty) {
                  return;
                }

                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(cart: state.cart));

                Navigator.of(context).pushNamedAndRemoveUntil(
                  CheckoutScreen.routeName,
                  ModalRoute.withName('/home'),
                );
              },
              child: Text(
                'GO TO CHECKOUT',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong.'),
            );
          }
        },
      ),
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutSucceeded) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: Text(
                'BACK TO SHOPPING',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));
                context.read<CartBloc>().add(const CartProductClear());
              },
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return Center(
              child: Text(
                'Something went wrong.',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
              ),
            );
          }
        },
      ),
    ];
  }
}
