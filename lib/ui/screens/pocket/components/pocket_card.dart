import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/header_text.dart';
import 'package:wealth/util.dart';

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
