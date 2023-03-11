import 'package:flutter/material.dart';

import 'components/budget_body.dart';


class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BudgetBody(),
    );
  }
}
