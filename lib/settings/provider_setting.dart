import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/ui/controllers/managers/home_screen_manager.dart';

import '../logic/managers/user_manager.dart';
import '../ui/controllers/managers/account_screen_manager.dart';

// This class handles all providers and recieves MaterialApp(WidgetApp) as child
class ProviderSetting extends StatelessWidget {
  const ProviderSetting({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeScreenManager>(
          create: (context) => HomeScreenManager(),
        ),
        ChangeNotifierProvider<AccountScreenManager>(
          create: (context) => AccountScreenManager(),
        ),
        ChangeNotifierProvider<IncomeSourceManager>(
          create: (context) => IncomeSourceManager(),
        ),
        // ChangeNotifierProvider<BudgetManager>(
        //   create: (context) => BudgetManager(),
        // ),
        ChangeNotifierProvider<InvestmentAccountManager>(
          create: (context) => InvestmentAccountManager(),
        ),
        ChangeNotifierProvider<EmergencyAccountManager>(
          create: (context) => EmergencyAccountManager(),
        ),
        ChangeNotifierProvider<UserManager>(
          create: (context) => UserManager(),
        ),
      ],
      child: child,
    );
  }
}
