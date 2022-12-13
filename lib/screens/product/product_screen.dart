import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../blocs/wishlist/wishlist_bloc.dart';
// import '../../blocs/cart/cart_bloc.dart';

// import '../screens.dart';

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
      builder: (context) => ProductScreen(product: product),
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
            bottomNavigationBar: CustomNavBar(
              screen: routeName,
              product: product,
              isWishlist: _isWishlist,
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
