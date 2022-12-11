import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';

// import '../../models/models.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {},
              child: Text(
                'GO TO CHECKOUT',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartProductLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                state.cart.freeDeliveryString,
                                style: Theme.of(context).textTheme.headline5,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(),
                                elevation: 0,
                                padding: const EdgeInsets.all(5),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                              child: Text(
                                'Add More Items',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: state.cart.productQuantity().length,
                            itemBuilder: (_, index) => CartProductCard(
                              // key: Key(index.toString()),
                              product: state.cart.productQuantity().keys.elementAt(index),
                              quantity: state.cart.productQuantity().values.elementAt(index),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Divider(
                          thickness: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SUBTOTAL',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    '\$${state.cart.subTotalString}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DELIVERY FREE',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    '\$${state.cart.deliveryFeeString}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                              ),
                              Text(
                                '\$${state.cart.totalString}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
