import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import './firebase_options.dart';

import 'package:flutter_ecommerce_app/simple_bloc_observer.dart';

import './blocs/wishlist/wishlist_bloc.dart';
import './blocs/cart/cart_bloc.dart';

import './screens/screens.dart';

import './config/app_router.dart';
import './config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
          create: (_) => WishlistBloc()..add(const StartWishlist()),
          lazy: false,
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()..add(const CartProductStarted()),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: const HomeScreen(),
      ),
    );
  }
}
