import 'package:flutter/material.dart';

import '../../util.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.assetName,
    required this.label,
    this.onTap,
    required this.radius,
    this.color,
    this.scale,
    this.marginVertical,
    this.width,
    this.crossAxisAlignment, this.marginHorizontal,
  });
  final String assetName;
  final String label;
  final Function()? onTap;
  final double radius;
  final Color? color;
  final double? scale;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? width;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVertical ?? 10,
            horizontal: marginHorizontal ?? 0.0),
        width: width ?? size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: kPrimaryColor),
                shape: BoxShape.circle,
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: color ?? Colors.transparent,
                  radius: radius,
                  child: Image.asset(
                    assetName,
                    scale: scale,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: label != '',
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
