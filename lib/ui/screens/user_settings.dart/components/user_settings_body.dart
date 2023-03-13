import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/user_manager.dart';
import 'package:wealth/logic/models/exceptions.dart';
import 'package:wealth/ui/screens/home/components/home_screen_manager.dart';
import 'package:wealth/ui/screens/home/home_screen.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/widgets/loader.dart';
import 'package:wealth/util.dart';

import '../../../widgets/messenger.dart';

class UserSettingsBody extends StatelessWidget {
  const UserSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // const ListTile(
        //   title: Text("Update password"),
        //   // onTap: () => Navigator.pushReplacement(
        //   //     context,
        //   //     MaterialPageRoute(
        //   //         builder: (context) => const PasswordUpdateScreen())),
        // ),
        ListTile(
            title: const Text("Log out"),
            trailing: const Icon(
              Icons.exit_to_app,
              color: kPrimaryColorAccent,
            ),
            //textColor: kFontColorRed,
            onTap: () {
              Messenger.showAlertDialog(
                  message: "You are about to be logged out",
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LogoutFuture(
                              future: context.read<UserManager>().signUserOut(),
                            );
                          }));
                        },
                        child: const Text("Log out")),
                  ],
                  context: context);
            }),
      ],
    );
  }
}

class LogoutFuture extends StatelessWidget {
  const LogoutFuture({super.key, required this.future});
  final Future<void> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snap) {
        Widget widget = const HomeScreen();
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) {
            final err = snap.error as UserDataException;
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Messenger.showSnackBar(
                  message: err.errorMessage, context: context);
            });
          } else {
            widget = const LoginScreen();
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              context.read<HomeScreenManager>().selectedIndex = 0;
            });
          }
        } else if (snap.connectionState == ConnectionState.waiting) {
          widget = const LoadingScreen();
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            Messenger.showSnackBar(
                message: "Something went wrong", context: context);
          });
        }

        return widget;
      },
    );
  }
}
