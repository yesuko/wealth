import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:wealth/database/user_database.dart';

import '../models/user_model.dart';

class UserManager extends ChangeNotifier {
  UserModel? currentUser;
  Future<void> registerNewUser(UserModel userModel, String password) async {
    await UserDatabase.registerNewUser(userModel, password: password);
    await fetchUserData();
  }

  Future<void> signInUser(String email, String password) async {
    await UserDatabase.signInUsingEmailPassword(
        email: email, password: password);
    await fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      currentUser = await UserDatabase.fetchUserData(user.uid);
    } else {
      currentUser = null;
    }
    notifyListeners();
  }

  Future<void> signUserOut() async {
    await UserDatabase.signOut();
    await fetchUserData();
  }
}
