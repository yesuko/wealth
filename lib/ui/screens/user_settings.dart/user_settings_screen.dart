import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/avatar.dart';
import 'package:wealth/ui/widgets/top_bar.dart';
import 'package:wealth/util.dart';

import 'components/user_settings_body.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(
        title: Screens.Settings.name,
        centerTitle: false,
        actions: [
          AvatarPane(
            isForRegistration: false,
            radius: size.height * 0.010,
            scale: size.height * 0.005,
            marginVertical: 3,
            marginHorizontal: 10,
            crossAxisAlignment: CrossAxisAlignment.end,
          )
        ],
      ),
      body: const UserSettingsBody(),
    );
  }
}
