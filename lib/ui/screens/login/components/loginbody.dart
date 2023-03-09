import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wealth/ui/screens/home/home_screen.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/screens/register/register_screen.dart';
import 'package:wealth/ui/widgets/login_register_link.dart';

import 'package:wealth/ui/widgets/rounded_button.dart';
import 'package:wealth/ui/widgets/rounded_input_field.dart';
import 'package:wealth/ui/widgets/rounded_password_field.dart';

import '../../../../logic/managers/user_manager.dart';
import '../../../../logic/models/exceptions.dart';
import '../../../ui_validator.dart';
import '../../../widgets/loader.dart';
import '../../../widgets/messenger.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String email = "", password = "";
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
                  onFieldSubmitted: (value) {
                    email = value;
                  },
                  validator: (value) {
                    return UIValidator.validateEmail(email);
                  },
                ),
                RoundedPasswordField(
                  onFieldSubmitted: (value) {
                    password = value;
                  },
                  validator: (value) {
                    return UIValidator.validatePassword(value);
                  },
                ),
                RoundedButton(
                    text: "LOG IN",
                    press: () {
                      if (_formKey.currentState!.validate() == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FutureSection(
                                future: context.read<UserManager>().signInUser(
                                      email,
                                      password,
                                    ),
                              ),
                            ));
                      }
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

class FutureSection extends StatelessWidget {
  const FutureSection({
    super.key,
    required this.future,
  });

  final Future future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (_, snap) {
          Widget widget = const LoginScreen();
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              widget = const HomeScreen();
            } else if (snap.hasError) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                var error = snap.error as UserDataException;

                Messenger.showSnackBar(
                    message: error.errorMessage, context: context);
              });
            }
          } else if (snap.connectionState == ConnectionState.waiting) {
            widget = const LoadingScreen();
          } else {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Messenger.showSnackBar(
                  message: "Something went wrong", context: context);
            });
          }

          return widget;
        });
  }
}
