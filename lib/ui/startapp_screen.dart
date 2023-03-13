import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/ui/widgets/loader.dart';

import '../logic/managers/user_manager.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/startup/updateapp_screen.dart';

class StartAppScreen extends StatefulWidget {
  const StartAppScreen({super.key});

  @override
  State<StartAppScreen> createState() => _StartAppScreenState();
}

class _StartAppScreenState extends State<StartAppScreen> {
  late bool _isUserAlreadyLoggedIn;
  late bool _isAppVersionOld;
  late Future<void> _future;

  @override
  void initState() {
    super.initState();

    _isUserAlreadyLoggedIn = context.read<UserManager>().userIsLogedIn;
    if (_isUserAlreadyLoggedIn) {
      _future = _fetchUserData();
    }
    _isAppVersionOld = false;
  }

  Future<void> _fetchUserData() async {
    await context.read<UserManager>().fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAppVersionOld) {
      return const UpdateAppScreen();
    } else if (_isUserAlreadyLoggedIn) {
      return FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const HomeScreen();
            } else {
              return const LoadingScreen();
            }
          });
    } else {
      return const LoginScreen();
    }
  }
}
