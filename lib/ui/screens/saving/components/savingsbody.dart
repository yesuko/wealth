import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SavingsBody extends StatelessWidget {
  const SavingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset("assets/images/savings_bg.svg"));
  }
}
