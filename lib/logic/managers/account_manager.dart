import 'package:flutter/material.dart';
import 'package:wealth/logic/models/account_model.dart';

class SavingsAccountManager extends ChangeNotifier {
  final SavingsAccountModel model = SavingsAccountModel();

  SavingsAccountManager() {
    updateBalance();
  }

  void updateRate(double rate) {
    model.updateRate(rate);
    notifyListeners();
  }

  void updateBalance() {
    model.updateBalance();
    notifyListeners();
  }

  double get balance => model.balance;
  double get rate => model.rate;
  double get prevMonthAmount => model.prevMonthAmount;
}

class InvestmentAccountManager extends ChangeNotifier {
  final InvestmentAccountModel model = InvestmentAccountModel();

  InvestmentAccountManager() {
    updateBalance();
  }

  void updateRate(double rate) {
    model.updateRate(rate);
    notifyListeners();
  }

  void updateBalance() {
    model.updateBalance();
    notifyListeners();
  }

  double get balance => model.balance;
  double get rate => model.rate;
  double get prevMonthAmount => model.prevMonthAmount;
}

class EmergencyAccountManager extends ChangeNotifier {
  final EmergencyAccountModel model = EmergencyAccountModel();

  EmergencyAccountManager() {
    updateBalance();
  }

  void updateRate(double rate) {
    model.updateRate(rate);
    notifyListeners();
  }

  void updateBalance() {
    model.updateBalance();
    notifyListeners();
  }

  double get balance => model.balance;
  double get rate => model.rate;
  double get prevMonthAmount => model.prevMonthAmount;
}
