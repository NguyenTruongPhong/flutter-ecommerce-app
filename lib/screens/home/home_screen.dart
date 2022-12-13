import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/product/product_bloc.dart';

import '../../widgets/widgets.dart';

// import '../../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'Zero To Unicorn',
            ),
            bottomNavigationBar: const CustomNavBar(screen: HomeScreen.routeName),
            body: SingleChildScrollView(
              // padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CategoryLoaded) {
                        return Column(
                          children: [
                            SizedBox(
                              child: CarouselSlider(
                                carouselController: _carouselController,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 1.5,
                                  viewportFraction: 0.9,
                                  enlargeCenterPage: true,
                                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                                  // pageSnapping: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                ),
                                items: state.categories
                                    .map((category) =>
                                        HeroCarouselCard(category: category))
                                    .toList(),
                              ),
                            ),
                            CarouselIndicator(
                              carouselController: _carouselController,
                              current: _current,
                              categories: state.categories,
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text('Something went wrong.'),
                        );
                      }
                    },
                  ),
                  const SectionTitle(title: 'RECOMMENDED'),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ProductLoaded) {
                        return ProductCarousel(
                          products: state.products
                              .where((product) => product.isRecommended)
                              .toList(),
                        );
                      } else {
                        return const Center(
                          child: Text('Something went wrong.'),
                        );
                      }
                    },
                  ),
                  const SectionTitle(title: 'MOST POPULAR'),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ProductLoaded) {
                        return ProductCarousel(
                          products: state.products
                              .where((product) => product.isPopular)
                              .toList(),
                        );
                      } else {
                        return const Center(
                          child: Text('Something went wrong.'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
