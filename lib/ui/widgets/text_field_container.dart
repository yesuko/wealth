import 'package:flutter/material.dart';
import 'package:wealth/util.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double? scale;
  final Color? color;
  final double? marginHeight;

  const TextFieldContainer({
    required this.child,
    this.scale,
    Key? key,
    this.color,
    this.marginHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginHeight ?? 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      width: size.width * 0.9,
      height: size.height * (scale ?? 0.08),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(29),
      ),
      child: Align(alignment: Alignment.center, child: child),
    );
  }
}
