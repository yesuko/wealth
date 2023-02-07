import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/avatar_container.dart';
import 'package:wealth/ui/widgets/top_bar.dart';
import 'package:wealth/util.dart';

import 'components/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(
        title: kAccountScreenTitle,
        centerTitle: false,
        actions: [
          AvatarContainer(
            radius: 20,
          )
        ],
      ),
      body: AccountBody(),
    );
  }
}
