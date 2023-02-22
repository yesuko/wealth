import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/ui/screens/pocket/components/income_source_sheet.dart';
import 'package:wealth/ui/screens/pocket/components/pocket_activity.dart';
import 'package:wealth/ui/screens/pocket/components/pocket_card.dart';
import 'package:wealth/ui/screens/pocket/components/pocket_income.dart';
import 'package:wealth/ui/widgets/header_text.dart';
import 'package:wealth/util.dart';

class PocketBody extends StatelessWidget {
  const PocketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            PocketLayout(header: "Income", child: PocketIncome()),
            PocketLayout(header: "Account", child: PocketAccount()),
            PocketLayout(header: "Activities", child: PocketActivities()),
          ],
        ),
      ),
    );
  }
}

class PocketLayout extends StatelessWidget {
  const PocketLayout({super.key, required this.header, required this.child});
  final String header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderText(text: header, paddingVertival: 10),
        child,
      ],
    );
  }
}

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

class PocketAccount extends StatelessWidget {
  const PocketAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        PocketCard(
          title: Accounts.Savings.name,
          amount: context.watch<SavingsAccountManager>().balance,
          amountForLastMonth:
              context.read<SavingsAccountManager>().prevMonthAmount,
          percentage: context.read<SavingsAccountManager>().rate,
        ),
        PocketCard(
          title: Accounts.Investment.name,
          amount: context.watch<InvestmentAccountManager>().balance,
          amountForLastMonth:
              context.read<InvestmentAccountManager>().prevMonthAmount,
          percentage: context.read<InvestmentAccountManager>().rate,
        ),
        PocketCard(
          title: Accounts.Emergency.name,
          amount: context.watch<EmergencyAccountManager>().balance,
          amountForLastMonth:
              context.read<EmergencyAccountManager>().prevMonthAmount,
          percentage: context.read<EmergencyAccountManager>().rate,
        )
      ]),
    );
  }
}


class PocketActivities extends StatelessWidget {
  const PocketActivities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PocketActivity(
            title: "Add Income Source",
            icon: Image.asset("assets/icons/gold.png"),
            onTap: () {
              IncomeSourceBottomSheet.showAddIncomeSourceSheet(context);
            },
          ),
          PocketActivity(
            title: "Add Income",
            icon: Image.asset("assets/icons/add_income_dark.png"),
            onTap: () {
              IncomeSourceBottomSheet.showListOfSourecesAndUpdateIncome(
                  context);
            },
          ),
          PocketActivity(
            title: "Set Allocation",
            icon: Image.asset("assets/icons/rate.png"),
            onTap: () {
              IncomeSourceBottomSheet.showAccountsAndSetRateAllocation(context);
            },
          ),
          PocketActivity(
            title: "Withdraw Money",
            icon: Image.asset("assets/icons/payment.png"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

