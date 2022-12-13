import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';

// import '../../models/models.dart';

import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartProductLoaded) {
            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.cart.freeDeliveryString,
                                style: Theme.of(context).textTheme.headline5,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(),
                                  elevation: 0,
                                  padding: const EdgeInsets.all(5),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .popUntil(ModalRoute.withName('/home'));
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
                          if (state.cart.products.isNotEmpty)
                            BuiltCardProductList(
                              state: state,
                            ),
                        ],
                      ),
                      if (state.cart.products.isEmpty)
                        const BuildShowEmptyContent(
                          content: 'Your Cart is Empty!',
                          buttonTitle: 'Back To Shopping',
                        ),
                      const OrderSummary(),
                    ],
                  ),
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

class BuiltCardProductList extends StatelessWidget {
  const BuiltCardProductList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CartProductLoaded state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: state.cart.productQuantity().length,
        itemBuilder: (_, index) => CartProductCard(
          // key: Key(index.toString()),
          product: state.cart.productQuantity().keys.elementAt(index),
          quantity: state.cart.productQuantity().values.elementAt(index),
        ),
      ),
    );
  }
}
