import 'package:flutter/material.dart';

class AccountScreenManager extends ChangeNotifier {
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  set selectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
