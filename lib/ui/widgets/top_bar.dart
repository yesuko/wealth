import 'package:flutter/material.dart';

import '../../util.dart';
import 'header_text.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    Key? key,
    this.leading,
    this.title = "",
    this.titleWidget,
    this.actions = const [],
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  final Widget? leading;
  final Widget? titleWidget;
  final String title;
  final List<Widget> actions;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: preferredSize.height,
        leading: leading,
        centerTitle: centerTitle,
        automaticallyImplyLeading: automaticallyImplyLeading,
        elevation: 0.0,
        title: titleWidget ??
            HeaderText(
              text: title,
              paddingVertival: 1.0,
              alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
              paddingHorizontal: centerTitle ? null : 0,
            ),
        actions: actions,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            //color: kSecondaryColor,
            height: 0.5,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolBarHeight);
}

class TopBarWithTabs extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget? leading;

  final String title;
  final List<Tab> tabs;

  const TopBarWithTabs({
    Key? key,
    this.actions = const [],
    required this.title,
    this.leading,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: leading,
        automaticallyImplyLeading: false,
        title: HeaderText(text: title),
        centerTitle: false,
        actions: actions,
        elevation: 0,
        bottom: TabBar(
          //indicatorColor: kPrimaryColor,
          //labelColor: kFontColorBlack,
          indicatorWeight: 3.0,
          indicatorPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          //unselectedLabelColor: kSecondaryColor,
          tabs: tabs,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kExtendedToolBarHeight);
}
