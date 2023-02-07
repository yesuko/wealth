import 'package:flutter/material.dart';
import 'package:wealth/util.dart';

class LoginRegisterLink extends StatelessWidget {
  final bool isLoginPage;
  final Function press;

  const LoginRegisterLink(
      {this.isLoginPage = true, required this.press, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => press(),
        child: Text.rich(
          TextSpan(
            text:
                isLoginPage ? "Create an account" : "I already have an account",
            style: const TextStyle(
              color: kPrimaryColorAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
