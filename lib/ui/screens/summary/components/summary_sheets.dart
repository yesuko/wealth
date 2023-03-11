import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/logic/models/income_source_model.dart';
import 'package:wealth/ui/screens/summary/components/summary_controller.dart';
import 'package:wealth/ui/ui_validator.dart';
import 'package:wealth/ui/widgets/bottom_sheet.dart';
import 'package:wealth/ui/widgets/messenger.dart';
import 'package:wealth/ui/widgets/rounded_button.dart';
import 'package:wealth/ui/widgets/rounded_input_field.dart';
import 'package:wealth/ui/widgets/tile.dart';
import 'package:wealth/util.dart';

class PocketBottomSheet {
  static showAddIncomeSourceSheet(
    BuildContext context,
  ) {
    String? name;
    String amount = "0.00";

    final formKey = GlobalKey<FormState>();

    return BottomSheetLayout.showModalSheet(
      context: context,
      header: "Add Income Source",
      child: Form(
        key: formKey,
        child: Column(
          children: [
            RoundedInputField(
              iconData: Icons.abc,
              hintText: "Enter name",
              initialValue: name,
              onChanged: (value) {
                name = value;
              },
              validator: (String? value) {
                return UIValidator.validateName(name);
              },
            ),
            RoundedInputField(
              iconData: Icons.money,
              hintText: "0.00",
              initialValue: null,
              enabled: false,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amount = value;
              },
              validator: (String? val) {
                return UIValidator.validateAmount(amount);
              },
            ),
            RoundedButton(
              text: "Add amount",
              press: () async {
                if (formKey.currentState!.validate()) {
                  //await UssdAdvanced.sendUssd(
                  //     code: "*171*1*3*0559904540#", subscriptionId: 1);
                  if (name != null) {
                    PocketController.addNewIncomeSource(
                      context,
                      IncomeSourceModel.withAttibutes(
                        name: name!,
                        createdOn: DateTime.now(),
                        income: double.parse(amount),
                      ),
                    );

                    Messenger.showSnackBar(
                      message: "$name added to Income Sources",
                      context: context,
                    );
                    Navigator.pop(context);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static showViewSourceSheet(BuildContext context) {
    return BottomSheetLayout.showModalSheet(
      context: context,
      header: "Income Sources",
      child: Consumer<IncomeSourceManager>(
        builder: (_, manager, __) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: manager.incomeSources.length,
            itemBuilder: (context, index) {
              return IncomeSourceTile(
                name: manager.incomeSources[index].name,
                amount: manager.incomeSources[index].income,
              );
            }),
      ),
    );
  }

  static showListOfSourecesAndUpdateIncome(BuildContext context) {
    return BottomSheetLayout.showModalSheet(
      context: context,
      header: "Choose Income Source",
      child: Consumer<IncomeSourceManager>(
        builder: (_, manager, __) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: manager.incomeSources.length,
            itemBuilder: (context, index) {
              return IncomeSourceTile(
                name: manager.incomeSources[index].name,
                amount: manager.incomeSources[index].income,
                onTap: () {},
              );
            }),
      ),
    );
  }

  static showAccountsAndSetRateAllocation(BuildContext context) {
    List<TextEditingController> controllers = [
      
      TextEditingController(
          text: context.read<InvestmentAccountManager>().rate.toString()),
      TextEditingController(
          text: context.read<EmergencyAccountManager>().rate.toString())
    ];

    return BottomSheetLayout.showModalSheet(
        context: context,
        header: "Set Account Rate",
        child: ListView(
          children: [
            RateTile(
              controller: controllers[0],
              title: Accounts.Budget.name,
            ),
            RateTile(
              controller: controllers[1],
              title: Accounts.Investment.name,
            ),
            RateTile(
              controller: controllers[2],
              title: Accounts.Emergency.name,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            RoundedButton(
                text: "Set",
                press: () {
                  double totalPercentage = controllers
                      .map((e) => double.tryParse(e.text) ?? 0)
                      .reduce((value, element) => value + element);

                  if (totalPercentage > 100 || totalPercentage < 100) {
                    Messenger.showSnackBar(
                      message: "The sum of rates must be equal to 100%",
                      context: context,
                      behavior: SnackBarBehavior.floating,
                    );
                  } else {
                   

                    context
                        .read<InvestmentAccountManager>()
                        .updateRate(double.parse(controllers[1].text));
                    context.read<InvestmentAccountManager>().updateBalance();
                    context
                        .read<EmergencyAccountManager>()
                        .updateRate(double.parse(controllers[2].text));

                    context.read<EmergencyAccountManager>().updateBalance();

                    Messenger.showSnackBar(
                      message: "Account rates updated",
                      context: context,
                      behavior: SnackBarBehavior.floating,
                    );
                  }
                  Navigator.pop(context);
                })
          ],
        ));
  }
}

class IncomeSourceTile extends StatelessWidget {
  const IncomeSourceTile({
    super.key,
    required this.name,
    required this.amount,
    this.onTap,
  });

  final String name;
  final double amount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Tile(
      title: toBeginningOfSentenceCase(name) ?? "",
      tailText: '$kCurrencyUnit $amount',
      onTap: onTap,
    );
  }
}

class RateTile extends StatefulWidget {
  const RateTile(
      {super.key,
      required this.controller,
      required this.title,
      this.onChanged});
  final TextEditingController controller;
  final String title;
  final Function(String)? onChanged;

  @override
  State<RateTile> createState() => _RateTileState();
}

class _RateTileState extends State<RateTile> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    onChanged: widget.onChanged,
                    controller: widget.controller,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(3),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      "%",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
