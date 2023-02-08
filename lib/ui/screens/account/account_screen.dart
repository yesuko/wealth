import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/avatar.dart';
import 'package:wealth/ui/widgets/top_bar.dart';
import 'package:wealth/util.dart';

import 'components/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(
        title: kAccountScreenTitle,
        centerTitle: false,
        actions: [
          Avatar(
            assetName: "assets/icons/s1.png",
            radius: size.height * 0.011,
            scale: size.height * 0.005,
            label: '',
            marginVertical: 3,
            marginHorizontal: 10,
            crossAxisAlignment: CrossAxisAlignment.end,
          )
        ],
      ),
      body: const AccountBody(),
    );
  }
}
