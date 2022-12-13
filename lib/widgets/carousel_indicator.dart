import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../models/models.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    Key? key,
    required CarouselController carouselController,
    required int current,
    required List<Category> categories,
  })  : _carouselController = carouselController,
        _current = current,
        _categories = categories,
        super(key: key);

  final int _current;
  final List<Category> _categories;
  final CarouselController _carouselController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _categories.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(entry.key),
          child: Container(
            width: 10.0,
            height: 10.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(_current == entry.key ? 0.9 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
