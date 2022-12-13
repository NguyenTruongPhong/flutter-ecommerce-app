import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      dense: false,
      // shape: const RoundedRectangleBorder(
      //   side: BorderSide(color: Colors.black, width: 1),
      // ),
      leading: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
        height: 80,
        width: 100,
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        '\$${product.price}',
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<CartBloc>()
                  .add(CartProductRemoved(product: product));
            },
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.black,
            ),
          ),
          Text(
            '$quantity',
            style: Theme.of(context).textTheme.headline5,
          ),
          IconButton(
            onPressed: () {
              context.read<CartBloc>().add(CartProductAdded(product: product));
            },
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
