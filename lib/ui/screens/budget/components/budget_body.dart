
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BudgetBody extends StatelessWidget {
  const BudgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset("assets/images/budget_bg.svg"));
  }
}
