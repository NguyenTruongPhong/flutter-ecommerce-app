import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.horizontalPadding = 20,
  }) : super(key: key);

  final String title;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
