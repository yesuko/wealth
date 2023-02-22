import 'package:flutter/material.dart';
import 'package:wealth/settings/startapp_setting.dart';

void main() {
  runApp(const StartAppSetting());
}


// structure
// main -> StartAppSetting -> ProviderSetting -> RestOfAppWidgets
// main            - main entry point of app
// StartAppSetting - calls the WidgetApp(MaterialApp), and handles the necessary configurations 
// ProviderSetting - handles all providers


