import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wealth/settings/config_setting.dart';
import 'package:wealth/settings/startapp_setting.dart';

void main() async {
  // initialize all firebase dependencies
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //setting up for using EMULATOR OR INTERNET
  await ConfigurationSetting.config();
  runApp(const StartAppSetting());
}


// structure
// main -> StartAppSetting -> ProviderSetting -> RestOfAppWidgets
// main            - main entry point of app
// StartAppSetting - calls the WidgetApp(MaterialApp), and handles the necessary configurations 
// ProviderSetting - handles all providers


