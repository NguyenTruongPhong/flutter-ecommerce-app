import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartProductLoaded) {
          return Column(
            children: [
              const Divider(
                thickness: 3,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '\$${state.cart.subTotalString}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELIVERY FEE',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          state.cart.products.isEmpty
                              ? '\$0.00'
                              : '\$${state.cart.deliveryFeeString}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                    Text(
                      '\$${state.cart.totalString}',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('Something went wrong.'),
          );
        }
      },
    );
  }
}
