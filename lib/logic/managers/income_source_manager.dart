import 'package:flutter/material.dart';
import 'package:wealth/logic/models/account_model.dart';
import 'package:wealth/logic/models/income_source_model.dart';

class IncomeSourceManager extends ChangeNotifier {
  late final List<IncomeSourceModel> incomeSources;
  double get totalIncome => Account.income;

  IncomeSourceManager() {
    incomeSources = [
      IncomeSourceModel.withAttibutes(
          name: "Other", createdOn: DateTime.now(), income: 0)
    ];

    calculateAndUpdateTotalIncome();
  }

  void addIncomeSource(IncomeSourceModel incomeSourceModel) {
    incomeSources.add(incomeSourceModel);
    notifyListeners();
  }

  void updateIncomeSourceRecord(double income, int index) {
    incomeSources[index].income = income;
    incomeSources[index].updateRecord(DateTime.now(), income);
    notifyListeners();
  }

  void updateIncomeSourceIncome(int incomeSourceIndex, double newIncome) {
    incomeSources[incomeSourceIndex].income += newIncome;
    notifyListeners();
  }

  void calculateAndUpdateTotalIncome() {
    double total = 0;
    for (var element in incomeSources) {
      total += element.income;
    }
    updateAccountIncome(total);
  }

  void updateAccountIncome(double income) {
    Account.income = income;
    notifyListeners();
  }
}
