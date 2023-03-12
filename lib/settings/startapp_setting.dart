import 'package:flutter/material.dart';
import 'package:wealth/settings/provider_setting.dart';
import 'package:wealth/ui/startapp_screen.dart';
import 'package:wealth/util.dart';

import '../ui/routes.dart';

// This class Calls the WidgetApp(MaterialApp), and handles the necessary configurations
class StartAppSetting extends StatelessWidget {
  const StartAppSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderSetting(
      child: MaterialApp(
      onGenerateRoute: GeneratedRoute.generateRoute,
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        home: const StartAppScreen(),
        theme: ThemeData(
          colorSchemeSeed: Colors.amber[500],
        ),
      ),
    );
  }
}
