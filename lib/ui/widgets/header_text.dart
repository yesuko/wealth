import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final AlignmentGeometry? alignment;
  final double? paddingVertival;
  final double? paddingHorizontal;

  const HeaderText({
    Key? key,
    required this.text,
    this.size = 22.0,
    this.color,
    this.alignment,
    this.paddingVertival,
    this.paddingHorizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: paddingVertival ?? 4.0,
          horizontal: paddingHorizontal ?? 4.0,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color ?? Colors.black,
              fontSize: size,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
