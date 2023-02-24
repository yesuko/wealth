import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/account_manager.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/ui/screens/pocket/components/pocket_sheets.dart';
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
                PocketBottomSheet.showViewSourceSheet(context);
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
            title: "Add Source",
            icon: Image.asset("assets/icons/gold.png"),
            onTap: () {
              PocketBottomSheet.showAddIncomeSourceSheet(context);
            },
          ),
          PocketActivity(
            title: "Add Income",
            icon: Image.asset("assets/icons/add_income_dark.png"),
            onTap: () {
              PocketBottomSheet.showListOfSourecesAndUpdateIncome(context);
            },
          ),
          PocketActivity(
            title: "Set Allocation",
            icon: Image.asset("assets/icons/rate.png"),
            onTap: () {
              PocketBottomSheet.showAccountsAndSetRateAllocation(context);
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

/// Pocket card layout widget
class PocketCard extends StatelessWidget {
  const PocketCard({
    super.key,
    required this.title,
    required this.amount,
    required this.percentage,
    required this.amountForLastMonth,
  });
  final String title;
  final double amount;
  final double amountForLastMonth;

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: size.height * 0.2,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "${percentage.toStringAsFixed(1)} %",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 120,
            //fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(4),
                  child: getIconFromComparingAmountForLastMonthToAmount(),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width * 0.6),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: HeaderText(
                        text: "$currencyUnit ${amount.toStringAsFixed(2)}",
                        paddingHorizontal: 0,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 90,
            child: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "$currencyUnit ${amountForLastMonth.toStringAsFixed(2)}",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                        fontWeight: FontWeight.bold,
                        decorationColor: getDecorationColorFromAccountName(),
                        decorationThickness: 3.0,
                      ),
                    ),
                    TextSpan(
                        text: title == Accounts.Emergency.name
                            ? " spent last month"
                            : " reached last month",
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon getIconFromComparingAmountForLastMonthToAmount() {
    if (amountForLastMonth < amount) {
      return const Icon(Icons.arrow_drop_up);
    } else if (amountForLastMonth > amount) {
      return const Icon(Icons.arrow_drop_down);
    } else {
      return const Icon(Icons.arrow_right);
    }
  }

  Color getDecorationColorFromAccountName() {
    if (title == Accounts.Emergency.name) {
      return emergencyColor;
    } else if (title == Accounts.Savings.name) {
      return savingsColor;
    } else {
      return investmentColor;
    }
  }
}

/// Pockets activity layout widget
class PocketActivity extends StatelessWidget {
  const PocketActivity(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final Widget icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}
