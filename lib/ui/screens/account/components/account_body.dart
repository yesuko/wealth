import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/util.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            }),
      ],
    );
  }
}
