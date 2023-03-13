import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/home/components/homebody.dart';
import 'package:wealth/ui/screens/home/components/homebottom.dart';
import 'package:wealth/ui/screens/summary/summary_screen.dart';
import 'package:wealth/ui/screens/user_settings.dart/user_settings_screen.dart';
import 'package:wealth/util.dart';

import '../account/account_screen.dart';

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
      const SummaryScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.dashboard_customize_outlined),
        label: Screens.Summary.name,
      ),
      const AccountScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.account_balance_outlined),
        label: Screens.Accounts.name,
      ),
      const UserSettingsScreen(): BottomNavigationBarItem(
        icon: const Icon(Icons.manage_accounts_outlined),
        label: Screens.Settings.name,
      ),
    };
  }
}
