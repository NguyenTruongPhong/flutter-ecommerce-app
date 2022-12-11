import 'package:flutter/material.dart';

import '../models/models.dart';

import 'widgets.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemCount: products.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ProductCard(
            product: products[index],
          ),
        ),
      ),
    );
  }
}
