
import 'package:wealth/settings/firebase_config.dart';

class ConfigurationSetting {
  static Future<void> config() async {
    //setting up for using EMULATOR, LOCAL DEVICE OR INTERNET
    if (const bool.fromEnvironment("USE_FIREBASE_EMU")) {
      await FirebaseConfig.configureFirebaseAuth();
      FirebaseConfig.configureFirebaseFirestore();
    }
  }
}
