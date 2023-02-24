
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig{
   static Future<void> configureFirebaseAuth() async {
    String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
    int configPort = const int.fromEnvironment("AUTH_EMU_PORT");

    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 9099;

    await FirebaseAuth.instance.useAuthEmulator(host, port);
    debugPrint("Using Firebase Firestore emulator on: $host: $port");
  }


  static void configureFirebaseFirestore() {
    String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
    int configPort = const int.fromEnvironment("FB_EMU_PORT");

    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 8080;

    FirebaseFirestore.instance.settings = Settings(
        host: '$host:$port', persistenceEnabled: false, sslEnabled: false);
    debugPrint("Using Firebase Firestore emulator on: $host: $port");
  }
}