import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/emergency/emergency_screen.dart';
import 'package:wealth/ui/screens/investment/investments_screen.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        InvestmentsScreen(),
        EmergencyScreen(),
      ],
    );
  }
}
