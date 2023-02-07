import 'package:flutter/material.dart';

class PlaceHolderContainer extends StatelessWidget {
  final double width, height;

  const PlaceHolderContainer(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Placeholder(
        strokeWidth: 1,
        color: Colors.grey,
        fallbackHeight: height,
        fallbackWidth: width,
      ),
    );
  }
}
