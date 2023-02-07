import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wealth/ui/screens/home/home_screen.dart';
import 'package:wealth/ui/screens/register/register_screen.dart';
import 'package:wealth/ui/widgets/login_register_link.dart';

import 'package:wealth/ui/widgets/rounded_button.dart';
import 'package:wealth/ui/widgets/rounded_input_field.dart';
import 'package:wealth/ui/widgets/rounded_password_field.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: SvgPicture.asset(
                    "assets/images/login_female.svg",
                    height: size.height * 0.4,
                  ),
                ),
                RoundedInputField(
                  iconData: Icons.mail,
                  hintText: "Email",
                  onChanged: (value) {
                    //email = value;
                  },
                  validator: (_) {
                    return null; //ValidatorService.validateEmail(email);
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    // password = value;
                  },
                  validator: (_) {
                    return null;
                    //ValidatorService.validatePassword(password);
                  },
                ),
                RoundedButton(
                    text: "LOG IN",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }),
                LoginRegisterLink(press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
