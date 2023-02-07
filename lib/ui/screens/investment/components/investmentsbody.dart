import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class InvestmentsBody extends StatelessWidget {
  const InvestmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset("assets/images/investments_bg.svg"));
  }
}