import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/summary/components/summary_body.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SummaryBody(),
    );
  }
}
