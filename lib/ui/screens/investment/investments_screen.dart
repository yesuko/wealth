import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/investment/components/investmentsbody.dart';


class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: InvestmentsBody(),);
  }
}