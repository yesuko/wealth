import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/user_manager.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/screens/startup/updateapp_screen.dart';

import 'screens/home/home_screen.dart';

class StartAppScreen extends StatelessWidget {
  const StartAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool flag = false;

    if (flag == true) {
      return const UpdateAppScreen();
    } else if (context.read<UserManager>().userIsLogedIn) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
