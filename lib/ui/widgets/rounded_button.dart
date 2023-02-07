import 'package:flutter/material.dart';
import 'package:wealth/util.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color? color, textColor;

  const RoundedButton(
      {required this.text,
      required this.press,
      this.color,
      this.textColor = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
          ),
          onPressed: () => press(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Text(
              text,
              //style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
