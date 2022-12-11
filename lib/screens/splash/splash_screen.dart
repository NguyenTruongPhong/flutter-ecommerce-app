import 'package:flutter/material.dart';

import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamed('/');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                'Hero To Unicorn',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
