import 'package:flutter/material.dart';

class Messenger {
  static dynamic showSnackBar(
      {required String message,
      required BuildContext context,
      int seconds = 2,
      SnackBarAction? action,
      SnackBarBehavior? behavior}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 3,
        //backgroundColor: kSnackBarBgColor,
        behavior: behavior,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: seconds),
        action: action,
      ),
    );
  }

  static Future<dynamic> showAlertDialog({
    required String message,
    required List<Widget> actions,
    MainAxisAlignment? actionsAlignment,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Text(
          message,
          textAlign: TextAlign.justify,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        actions: actions,
        actionsAlignment: actionsAlignment,
      ),
    );
  }
}
