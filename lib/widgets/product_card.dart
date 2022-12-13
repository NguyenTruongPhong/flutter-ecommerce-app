import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../blocs/cart/cart_bloc.dart';

import '../models/models.dart';

import '../screens/screens.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 0.0,
    this.isWishlist = false,
  }) : super(key: key);

  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ProductScreen.routeName,
        arguments: product,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          SizedBox(
            // alignment: Alignment.topCenter,
            // color: Colors.red,
            // alignment: Alignment.topLeft,
            height: 150,
            width: widthValue,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition + 5,
            right: 5,
            // width: widthValue - leftPosition,
            height: 80,
            child: Container(
              // height: 80,
              // width: 0,
              padding: const EdgeInsets.all(5),
              // margin: const EdgeInsets.all(5),
              // alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 65, 56, 56),
                  width: 3,
                ),
                color: Colors.black,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                          softWrap: true,
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          '\$${product.price}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(5),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartProductAdded(product: product));

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Added to your Cart.'),
                          ),
                        );
                    },
                    icon: const Icon(Icons.add_circle),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  isWishlist
                      ? IconButton(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(5),
                          onPressed: () {
                            context
                                .read<WishlistBloc>()
                                .add(RemoveWishlistProduct(product: product));
                          },
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
