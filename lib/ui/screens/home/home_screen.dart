import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/account/account_screen.dart';
import 'package:wealth/ui/screens/emergency/emergency_screen.dart';
import 'package:wealth/ui/screens/home/components/homebody.dart';
import 'package:wealth/ui/screens/home/components/homebottom.dart';
import 'package:wealth/ui/screens/investment/investments_screen.dart';
import 'package:wealth/ui/screens/pocket/pocket_screen.dart';
import 'package:wealth/ui/screens/saving/savings_screen.dart';
import 'package:wealth/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(
        children: mapScreenstoNavigationBarItems.keys.toList(),
      ),
      bottomNavigationBar: HomeBottom(
        items: mapScreenstoNavigationBarItems.values.toList(),
      ),
    );
  }

  Map<Widget, BottomNavigationBarItem> get mapScreenstoNavigationBarItems {
    /// build a map of bottom navigation item and their respective
    /// screens
    return {
      const PocketScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.wallet_outlined),
        label: Screens.Pockets.name,
      ),
      const SavingsScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.savings_outlined),
        label: Screens.Savings.name,
      ),
      const InvestmentsScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.account_balance_outlined),
        label: Screens.Investments.name,
      ),
      const EmergencyScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.payments_outlined),
        label: Screens.Emergency.name,
      ),
      const AccountScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle_outlined),
        label: Screens.Account.name,
      ),
    };
  }
}
