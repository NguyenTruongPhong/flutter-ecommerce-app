import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/widgets.dart';

import '../../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
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
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Zero To Unicorn',
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: CategoryModel.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
              ),
            ),
            CarouselIndicator(
              carouselController: _carouselController,
              current: _current,
              categories: CategoryModel.categories,
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            ProductCarousel(
              products: Product.productModels
                  .where((product) => product.isRecommended)
                  .toList(),
            ),
            const SectionTitle(title: 'MOST POPULAR'),
            ProductCarousel(
              products: Product.productModels
                  .where((product) => product.isPopular)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
