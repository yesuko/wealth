import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/screens/startup/updateapp_screen.dart';

class StartAppScreen extends StatelessWidget {
  const StartAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool flag = true;

    if (flag == true) {
      return const UpdateAppScreen();
    } else {
      return const LoginScreen();
    }
  }
}
