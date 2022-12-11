import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

import '../../models/models.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  static const String routeName = '/catalog';

  static Route route(CategoryModel category) {
    return MaterialPageRoute(
      builder: (_) => CatalogScreen(category: category),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Product.productModels
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.15,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: ProductCard(
              product: products[index],
              widthFactor: 2.2,
            ),
          );
        },
        itemCount: products.length,
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
