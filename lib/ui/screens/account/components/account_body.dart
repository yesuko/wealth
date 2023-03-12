import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/emergency/emergency_screen.dart';
import 'package:wealth/ui/screens/investment/investments_screen.dart';

class AccountBody extends StatelessWidget {
  final TabController? tabController;

  const AccountBody({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        InvestmentsScreen(),
        EmergencyScreen(),
      ],
    );
  }
}
