import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}