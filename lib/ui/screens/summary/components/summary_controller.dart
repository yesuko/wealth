import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/logic/models/income_source_model.dart';

class PocketController {
  static updateAllAccountBalance(BuildContext context) {
    context.read<SavingsAccountManager>().updateBalance();

    context.read<InvestmentAccountManager>().updateBalance();

    context.read<EmergencyAccountManager>().updateBalance();
  }

  static updateTotalIncomeOfSources(BuildContext context) {
    context.read<IncomeSourceManager>().calculateAndUpdateTotalIncome();
  }

  static addNewIncomeSource(BuildContext context, IncomeSourceModel model) {
    context.read<IncomeSourceManager>().addIncomeSource(model);
    updateTotalIncomeOfSources(context);
    updateAllAccountBalance(context);
  }
}
