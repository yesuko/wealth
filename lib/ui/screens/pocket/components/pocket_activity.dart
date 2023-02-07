import 'package:flutter/material.dart';

class PocketActivity extends StatelessWidget {
  const PocketActivity(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final Widget icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}
