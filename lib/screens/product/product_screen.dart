import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';

import '../screens.dart';

import '../../widgets/widgets.dart';

import '../../models/models.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });

  final Product product;

  static const String routeName = '/product';

  static Route route(Product product) {
    return MaterialPageRoute(
      builder: (_) => ProductScreen(product: product),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _isWishlist = false;
    return ScaffoldMessenger(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(
              title: product.name,
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.black,
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    BlocBuilder<WishlistBloc, WishlistState>(
                      builder: (context, state) {
                        _isWishlist = state is WishlistLoaded &&
                                state.wishlist.products.contains(product)
                            ? true
                            : false;
                        return IconButton(
                          onPressed: () {
                            var snackbar = const SnackBar(
                              content: Text(
                                  'Product was existing in your wishlist.'),
                            );

                            if (!_isWishlist) {
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
                            color: _isWishlist
                                ? Theme.of(context).errorColor
                                : Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductAdded(product: product));
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Text(
                        'ADD TO CART',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: [
                        HeroCarouselCard(product: product),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.grey),
                      color: Colors.black,
                    ),
                    child: ListTile(
                      title: Text(
                        product.name,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                      trailing: Text(
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      iconColor: Theme.of(context).iconTheme.color,
                      childrenPadding: const EdgeInsets.all(5).copyWith(top: 0),
                      title: Text(
                        'Product Information',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      children: [
                        Text(
                          'Soft drinks make a growing contribution to the diet of children and adolescents. The quantity of soft drinks consumed, especially carbonated soft drinks, increases with age and accounts for the largest single food contribution to nonmilk extrinsic sugar intake among young people in the UK (Burniat et al., 2002).',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      iconColor: Theme.of(context).iconTheme.color,
                      childrenPadding: const EdgeInsets.all(5).copyWith(top: 0),
                      title: Text(
                        'Delivery Information',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      children: [
                        Text(
                          'Soft drinks make a growing contribution to the diet of children and adolescents. The quantity of soft drinks consumed, especially carbonated soft drinks, increases with age and accounts for the largest single food contribution to nonmilk extrinsic sugar intake among young people in the UK (Burniat et al., 2002).',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
