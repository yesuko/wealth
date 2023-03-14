import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/logic/models/income_source_model.dart';
import 'package:wealth/services/hubtel_payment.dart';

class SummaryController {
  static updateAllAccountBalance(BuildContext context) {
    context.read<InvestmentAccountManager>().updateBalance();

    context.read<EmergencyAccountManager>().updateBalance();
  }

  static updateTotalIncomeOfSources(BuildContext context) {
    context.read<IncomeSourceManager>().calculateAndUpdateTotalIncome();
  }

  static void addNewIncomeSource(
      BuildContext context, IncomeSourceModel model) {
    context.read<IncomeSourceManager>().addIncomeSource(model);
    updateTotalIncomeOfSources(context);
    updateAllAccountBalance(context);
  }

  static Future<String> addIncome(String source, double amount) async {
    return HubtelPayment.makePayment(source, amount);
  }
}
