import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/header_text.dart';

import '../../../util.dart';
import 'components/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: TabBar(
            indicatorColor: kPrimaryColorAccent,
            labelColor: Colors.black,
            indicatorWeight: 3.0,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeaderText(
                        size: 16,
                        text: Screens.Investments.name,
                      ),
                      const Icon(Icons.trending_up_outlined)
                    ]),
              ),
              Tab(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HeaderText(
                        size: 16,
                        text: Screens.Emergency.name,
                      ),
                      const Icon(Icons.savings_outlined)
                    ]),
              )
            ],
          ),
          body: const AccountBody(),
        ),
      ),
    );
  }
}
