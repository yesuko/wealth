import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../logic/models/exceptions.dart';
import '../logic/models/user_model.dart';

class UserDatabase {
  // Function for registering a new user
  static Future<void> registerNewUser(
    UserModel userModel, {
    required String password,
  }) async {
    //get ctredential of newly created user
    UserCredential cred = await _createUserWithEmailAndPassword(
        email: userModel.email, password: password);

    User? user = cred.user;

    // upon success
    if (user != null) {
      //update user display name
      await user.updateDisplayName(userModel.firstName);
      await user.reload();

      //update userModel uid
      userModel.uid = user.uid;

      // add user details to firestore
      await saveUserData(userModel);
    }
  }

// API to create a new user with email and password
  static Future<UserCredential> _createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw UserDataException(e.code);
    }
  }

// save newly created and authenticated user details in firestore
  static Future<void> saveUserData(UserModel userModel) async {
    try {
      Map<String, dynamic> update = {
        'firstName': userModel.firstName,
        'lastName': userModel.lastName,
        'userType': userModel.userType,
        'phoneNumber': userModel.phoneNumber,
        'email': userModel.email
      };

     // option to merge new/updated data with old ones.
      SetOptions option = SetOptions(merge: true);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .set(update, option);
    } on FirebaseException catch (e) {
      throw UserDataException(e.code);
    }
  }

//API to fetch user data/ details (user model) saved in firestore.
  static Future<UserModel> fetchUserData(String uid) async {
    try {
      Map<String, dynamic> data = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then<Map<String, dynamic>>((value) => value.data()!);

      return UserModel.attributes(
        uid: uid,
        firstName: data['firstName'],
        lastName: data["lastName"],
        phoneNumber: data["phoneNumber"],
        userType: data["userType"],
        email: data["email"],
      );
    } on FirebaseException catch (e) {
      throw UserDataException(e.code);
    }
  }

  // authenticate already registered user
  static Future<void> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw UserDataException(e.message ?? e.code);
    }
  }

// log user out
  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw UserDataException('$e');
    }
  }
}
