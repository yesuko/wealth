import 'package:flutter/material.dart';

import 'screens/account/account_screen.dart';
import 'screens/emergency/emergency_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/investment/investments_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/register/register_screen.dart';
import 'screens/startup/updateapp_screen.dart';
import 'screens/summary/summary_screen.dart';
import 'screens/user_settings.dart/user_settings_screen.dart';
import 'widgets/top_bar.dart';

class GeneratedRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/account':
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case '/account/investments':
        return MaterialPageRoute(builder: (_) => const InvestmentsScreen());
      case '/account/emergency':
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case '/summary':
        return MaterialPageRoute(builder: (_) => const SummaryScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const UserSettingsScreen());
      case 'update':
        return MaterialPageRoute(builder: (_) => const UpdateAppScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case 'register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(
        automaticallyImplyLeading: true,
        title: 'Error',
        centerTitle: true,
      ),
      body: Center(child: Text('Page not found')),
    );
  }
}
