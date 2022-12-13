import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';

import '../../widgets/widgets.dart';

import '../../models/models.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    super.key,
    required this.category,
  });

  final Category category;

  static const String routeName = '/catalog';

  static Route route(Category category) {
    return MaterialPageRoute(
      builder: (context) => CatalogScreen(category: category),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName,),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoaded) {
            final List<Product> products = List.from(
              state.products
                  .where((product) => product.category == category.name),
            );
            return GridView.builder(
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
            );
          } else {
            return const Center(
              child: Text('Something went wrong.'),
            );
          }
        },
      ),
      
    );
  }
}
