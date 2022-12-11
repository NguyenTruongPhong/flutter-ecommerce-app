import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecommerce_app/blocs/wishlist/wishlist_bloc.dart';

// import '../../models/models.dart';

import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const WishlistScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Wishlist',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistLoaded) {
            // return Container(
            //   alignment: Alignment.topCenter,
            //   child: ProductCard(
            //     productModel: state.wishlist.products[0],
            //     widthFactor: 1.1,
            //     leftPosition: 20,
            //   ),
            // );
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.wishlist.products[index],
                  widthFactor: 0.9,
                  leftPosition: 100,
                  isWishlist: true,
                );
              },
            );
          } else {
            return const Center(
              child: Text('Something went wrong.'),
            );
          }
        },
      ),
    );
  }
}
