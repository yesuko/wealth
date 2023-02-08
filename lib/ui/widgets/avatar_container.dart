import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final double radius;
  final Color? color;

  const AvatarContainer({super.key, required this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: CircleAvatar(
        backgroundColor:color ?? Colors.grey,
        radius: radius,
      ),
    );
  }
}
