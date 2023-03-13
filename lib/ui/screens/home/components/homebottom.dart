import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/ui/screens/home/components/home_screen_manager.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({super.key, required this.items});
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenManager>(
      builder: (_, prov, __) => BottomNavigationBar(
        //selectedItemColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: prov.selectedIndex,
        onTap: (index) {
          prov.selectedIndex = index;
        },
        items: items,
      ),
    );
  }
}
