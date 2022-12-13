import 'package:flutter/material.dart';

import '../models/models.dart';

import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('On route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Error',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
          ),
          textTheme: Theme.of(context).textTheme,
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
