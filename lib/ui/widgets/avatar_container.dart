import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final double radius;
  final Color? color;
  final String assetName;
  final double? scale;

  const AvatarContainer(
      {super.key, required this.radius, this.color, required this.assetName, this.scale});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: CircleAvatar(
        backgroundColor: color ?? Colors.grey,
        radius: radius,
        //backgroundImage: AssetImage(assetName, ),
        child: Image.asset(
          assetName,
          scale: scale,
        ),
      ),
    );
  }
}
