import 'package:flutter/material.dart';

import '../../models/models.dart';

import '../../screens/screens.dart';

class HeroCarouselCard extends StatelessWidget {
  const HeroCarouselCard({
    super.key,
    this.category,
    this.product,
  });

  final CategoryModel? category;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.of(context).pushNamed(
            CatalogScreen.routeName,
            arguments: category as CategoryModel,
          );
        }
        return;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                product != null ? product!.imageUrl : category!.imageUrl,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    product != null ? '' : category!.name,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
