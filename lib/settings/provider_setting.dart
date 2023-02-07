import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/ui/screens/home/components/home_provider.dart';

class ProviderSetting extends StatelessWidget {
  const ProviderSetting({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<IncomeSourceManager>(
          create: (context) => IncomeSourceManager(),
        ),
        ChangeNotifierProvider<SavingsAccountManager>(
          create: (context) => SavingsAccountManager(),
        ),
        ChangeNotifierProvider<InvestmentAccountManager>(
          create: (context) => InvestmentAccountManager(),
        ),
        ChangeNotifierProvider<EmergencyAccountManager>(
          create: (context) => EmergencyAccountManager(),
        ),
      ],
      child: child,
    );
  }
}
