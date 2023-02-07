import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/account/account_screen.dart';
import 'package:wealth/ui/screens/emergency/emergency_screen.dart';
import 'package:wealth/ui/screens/home/components/homebody.dart';
import 'package:wealth/ui/screens/home/components/homebottom.dart';
import 'package:wealth/ui/screens/investment/investments_screen.dart';
import 'package:wealth/ui/screens/pocket/pocket_screen.dart';
import 'package:wealth/ui/screens/saving/savings_screen.dart';

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
      const PocketScreen(): const BottomNavigationBarItem(
        icon: Icon(Icons.wallet_outlined),
        label: "Pockets",
      ),
      const SavingsScreen(): const BottomNavigationBarItem(
        icon: Icon(Icons.savings_outlined),
        label: "Savings",
      ),
      const InvestmentsScreen(): const BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_outlined),
        label: "Investments",
      ),
      const EmergencyScreen(): const BottomNavigationBarItem(
        icon: Icon(Icons.payments_outlined),
        label: "Emergency",
      ),
      const AccountScreen(): const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        label: "Settings",
      ),
    };
  }
}
