import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/ui/screens/account/components/account_screen_manager.dart';
import 'package:wealth/ui/widgets/header_text.dart';

import '../../../util.dart';
import 'components/account_body.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabIndex = context.watch<AccountScreenManager>().selectedTab;
    _tabController.animateTo(_tabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TabBar(
          controller: _tabController,
          indicatorColor: kPrimaryColorAccent,
          labelColor: Colors.black,
          indicatorWeight: 3.0,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          unselectedLabelColor: Colors.grey,
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
        body: AccountBody(tabController: _tabController),
      ),
    );
  }
}
