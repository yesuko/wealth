import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/user_manager.dart';
import 'package:wealth/ui/controllers/managers/home_screen_manager.dart';
import 'package:wealth/util.dart';

import '../../../widgets/future_navigator.dart';
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
                          FutureNavigator.navigate(
                            context: context,
                            future: context.read<UserManager>().signUserOut(),
                            initialRoute: '/home',
                            destinationRoute: '/login',
                            callback: () => context
                                .read<HomeScreenManager>()
                                .selectedIndex = 0,
                          );
                        },
                        child: const Text("Log out")),
                  ],
                  context: context);
            }),
      ],
    );
  }
}
