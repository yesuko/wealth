import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/popupmenu_layout.dart';
import 'package:wealth/util.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.title,
    required this.tailText,
    this.popMenuItems = const [
      PopupMenuItem(child: SizedBox()),
    ],
    this.onPopMenuItemSelected,
    this.subText,
    this.onTap,
  });
  final String title;
  final String tailText;
  final String? subText;
  final Function(dynamic)? onPopMenuItemSelected;
  final List<PopupMenuItem> popMenuItems;
  final Function()? onTap;
  // final DateTime createdOn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !(onPopMenuItemSelected == null),
                    child: PopUpMenuButtonLayout(
                      popMenuItems: popMenuItems,
                      onPopMenuItemSelected: onPopMenuItemSelected,
                    ),
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: kDefaultFontColor,
                  ),
                ),
                Text(
                  tailText,
                  style: const TextStyle(
                    color: kDefaultFontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (subText != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    subText ?? "",
                    style: const TextStyle(
                      color: kSecondaryFontColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
