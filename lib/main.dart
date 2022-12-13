import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import './firebase_options.dart';
import './simple_bloc_observer.dart';

import './repositories/category/category_repository.dart';
import './repositories/product/product_repository.dart';
import './repositories/checkout/checkout_repository.dart';

import './blocs/wishlist/wishlist_bloc.dart';
import './blocs/cart/cart_bloc.dart';
import './blocs/category/category_bloc.dart';
import './blocs/product/product_bloc.dart';
import './blocs/checkout/checkout_bloc.dart';

import './screens/screens.dart';

import './config/app_router.dart';
import './config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>(
          create: (_) => CategoryRepository(),
        ),
        RepositoryProvider<ProductRepository>(
          create: (_) => ProductRepository(),
        ),
        RepositoryProvider<CheckoutRepository>(
          create: (_) => CheckoutRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WishlistBloc>(
            create: (_) => WishlistBloc()..add(const StartWishlist()),
          ),
          BlocProvider<CartBloc>(
            create: (_) => CartBloc()..add(const CartProductStarted()),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>(),
            )..add(const LoadCategory()),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              productRepository: context.read<ProductRepository>(),
            )..add(const LoadProduct()),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(
              checkoutRepository: context.read<CheckoutRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter ECommerce',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          // initialRoute: SplashScreen.routeName,
          onGenerateInitialRoutes: (initialRoute) => [SplashScreen.route()],
          // home: HomeScreen(),
        ),
      ),
    );
  }
}
