import 'package:flutter/material.dart';

class Messenger {
  static dynamic showSnackBar({
    required String message,
    required BuildContext context,
    int seconds = 2,
    SnackBarAction? action,
    SnackBarBehavior? behavior
  }) {
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
    required Function exitAction,
    required Function proceedAction,
    required String message,
    required String exitLabel,
    required String proceedLabel,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          message,
          textAlign: TextAlign.justify,
        ),
        actions: [
          TextButton(
            onPressed: () => exitAction(),
            child: Text(exitLabel),
          ),
          TextButton(
            onPressed: () => proceedAction(),
            child: Text(proceedLabel),
          ),
        ],
      ),
    );
  }
}
