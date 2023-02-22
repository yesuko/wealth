import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/managers/income_source_manager.dart';
import 'package:wealth/ui/screens/pocket/components/income_source_sheet.dart';
import 'package:wealth/ui/widgets/header_text.dart';
import 'package:wealth/ui/widgets/tile.dart';
import 'package:wealth/util.dart';



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
