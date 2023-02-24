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
    required Function()? leftButtonOnTap,
    required Function()? rightButtonOnTap,
    required String message,
    required String leftButtonLabel,
    required String rightButtonLabel,
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
            onPressed: leftButtonOnTap,
            child: Text(leftButtonLabel),
          ),
          TextButton(
            onPressed: rightButtonOnTap,
            child: Text(rightButtonLabel),
          ),
        ],
      ),
    );
  }
}
