import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/ui/screens/pocket/components/income_source_sheet.dart';
import 'package:wealth/ui/widgets/header_text.dart';
import 'package:wealth/ui/widgets/tile.dart';
import 'package:wealth/util.dart';

class PocketIncome extends StatelessWidget {
  const PocketIncome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: FittedBox(
              child: HeaderText(
                text:
                    "Total:  $currencyUnit ${context.watch<IncomeSourceManager>().totalIncome}",
                paddingHorizontal: 0,
                size: 25,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: () {
                IncomeSourceBottomSheet.showViewSourceSheet(context);
              },
              child: const Text.rich(
                TextSpan(
                  text: "View Sources",
                  style: TextStyle(
                    color: kPrimaryColorAccent,
                    //fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
      tailText: '$currencyUnit $amount',
      onTap: onTap,
    );
  }
}
