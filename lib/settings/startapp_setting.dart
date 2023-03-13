import 'package:flutter/material.dart';
import 'package:wealth/settings/provider_setting.dart';
import 'package:wealth/ui/startapp_screen.dart';
import 'package:wealth/util.dart';

import '../ui/screens/home/home_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/register/register_screen.dart';
import '../ui/screens/startup/updateapp_screen.dart';
import '../ui/widgets/loader.dart';

// This class Calls the WidgetApp(MaterialApp), and handles the necessary configurations
class StartAppSetting extends StatelessWidget {
  const StartAppSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderSetting(
      child: MaterialApp(
        routes: {
          '/': (context) => const StartAppScreen(),
          '/home': (context) => const HomeScreen(),
          '/register': (context) => const RegisterScreen(),
          '/login': (context) => const LoginScreen(),
          '/update': (context) => const UpdateAppScreen(),
          '/loading': (context) => const LoadingScreen(),
            
        },
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ThemeData(
          colorSchemeSeed: Colors.amber[500],
        ),
      ),
    );
  }
}
