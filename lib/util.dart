// Dimensions
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const double kToolBarHeight = 50.0;
const double kExtendedToolBarWithTabsHeight = 140;
const double kExtendedToolBarHeight = 100;
// const double kTitleSpacing = 30.0;
//const EdgeInsets kBottomPaddingOfTopBar = EdgeInsets.only(top: 1.0);

// App titles
const String kAppTitle = "Wealth";
const String kAccountScreenTitle = "Account";

// Avatars
//   Thrifty – Someone who saves and spends money carefully.
// Frugal – A person who is economical with money and avoids waste.
// Tightwad – A person who is excessively unwilling to spend money.
// Hoarder – Someone who saves and accumulates items, including money, beyond what is necessary.
// Saver – A person who regularly saves money.
// Investor – A person who puts money into investments with the expectation of making a profit.
// Penny-pincher – A person who is very careful with their money and tries to save as much as possible.
// Budgeter – A person who creates and follows a budget to manage their money.
const Map<String, String> kAvatarPaths = {
  "Saver": "assets/icons/s1.png",
  "Invester": "assets/icons/s2.png",
  "Frugal": "assets/icons/s3.png",
  "Tightward": "assets/icons/s4.png",
  "Thrifty": "assets/icons/s5.png",
  "Budgetor": "assets/icons/s6.png",
};

// unit
const String kCurrencyUnit = "GH₵";

// Arrow rate
enum RateArrow {
  increase,
  drop,
  flat,
}

// Accounts
enum Accounts {
  Savings,
  Investment,
  Emergency,
}

// Screens
enum Screens {
  Summary,
  Accounts,
  Savings,
  Investments,
  Emergency,
  Settings,
}

// colors
const emergencyColor = Color(0xFFBA68C8);
const emergencyColorDeep = Color(0XFF662a4a);
const emergencyColorSecondary = Color(0XFF462a66);

const savingsColor = Colors.teal;
const savingsColorDeep = Color(0xFF2a6646);
const savingsColorSecondary = Color(0xFF92E3A9);

const investmentColor = Color(0xFFFFC100);
const investmentColorDeep = Color(0xFF66462a);
const investmentColorSecondary = Color(0xFFedd785);

const kPrimaryColor = Color(0xFFedd785);
const kPrimaryColorAccent = Color(0xFF66462a);

const kDefaultButtonColor = Colors.grey;
const kDefaultFontColor = Colors.black;
const kSecondaryFontColor = Colors.black54;

//light gold=#f4df56
//deep gold = #ddb337
//light blue = #38afac
//deep blue = #34516a
//sky blue = #a0bfbb
//grey = #617471
// grey-browm = #b7ae84
// brown-skin tone = #af6d45
//deep brown-close to purple = #574447

// class StringEng {
//   static const String pockets = "Pockets";
//   static const String savings = "Savings";
//   static const String investments = "Investmenst";
//   static const String emergency = "Emergency";
//   static const String account = "Account";
// }
