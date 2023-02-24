import 'package:flutter/material.dart';
import 'package:wealth/settings/provider_setting.dart';
import 'package:wealth/ui/home.dart';
import 'package:wealth/util.dart';

// This class Calls the WidgetApp(MaterialApp), and handles the necessary configurations
class StartAppSetting extends StatelessWidget {
  const StartAppSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderSetting(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        home: const Home(),
        theme: ThemeData(
          colorSchemeSeed: Colors.amber[500],
        ),
      ),
    );
  }
}

