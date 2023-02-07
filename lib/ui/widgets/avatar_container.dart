import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final double radius;

  const AvatarContainer({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: radius,
      ),
    );
  }
}
