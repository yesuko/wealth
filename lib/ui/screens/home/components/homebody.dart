import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/ui/screens/home/components/home_screen_manager.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenManager>(
      builder: (_, prov, __) => IndexedStack(
        index: prov.selectedIndex,
        children: children,
      ),
    );
  }
}
