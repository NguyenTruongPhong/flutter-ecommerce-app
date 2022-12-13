import 'package:flutter/material.dart';

class BuildShowEmptyContent extends StatelessWidget {
  const BuildShowEmptyContent({
    Key? key,
    required this.content,
    required this.buttonTitle,
  }) : super(key: key);

  final String content;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            content,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black.withOpacity(0.7),
                ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () => Navigator.of(context).popUntil(
              ModalRoute.withName('/home'),
            ),
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
