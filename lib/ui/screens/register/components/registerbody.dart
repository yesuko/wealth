import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wealth/logic/models/exceptions.dart';
import 'package:wealth/ui/screens/home/home_screen.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/screens/register/register_screen.dart';
import 'package:wealth/ui/widgets/avatar.dart';
import 'package:wealth/ui/widgets/bottom_sheet.dart';
import 'package:wealth/ui/widgets/login_register_link.dart';
import 'package:wealth/ui/widgets/messenger.dart';
import 'package:wealth/ui/widgets/rounded_button.dart';
import 'package:wealth/ui/widgets/rounded_input_field.dart';
import 'package:wealth/ui/widgets/rounded_password_field.dart';

import '../../../../logic/managers/user_manager.dart';
import '../../../../logic/models/user_model.dart';
import '../../../ui_validator.dart';
import '../../../widgets/loader.dart';

// global variable shared by the register body and avarta pane to hole the type of user
late String userType;

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String firstName = "",
        lastName = "",
        phoneNumber = "",
        email = "",
        password = "";

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              AvatarPane(
                isForRegistration: true,
                radius: size.height * 0.05,
                scale: size.height * 0.01,
              ),
              RoundedInputField(
                hintText: "First Name",
                onFieldSubmitted: (value) {
                  firstName = value;
                },
                validator: (value) {
                  return UIValidator.validateName(value);
                },
              ),
              RoundedInputField(
                hintText: "Last Name",
                onFieldSubmitted: (value) {
                  lastName = value;
                },
                validator: (value) {
                  return UIValidator.validateName(value);
                },
              ),
              RoundedInputField(
                iconData: Icons.phone_android_outlined,
                keyboardType: TextInputType.phone,
                hintText: "Mobile Wallet Number",
                onFieldSubmitted: (value) {
                  phoneNumber = value;
                },
                validator: (value) {
                  return UIValidator.validatePhoneNumber(value);
                },
              ),
              RoundedInputField(
                iconData: Icons.email,
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                onFieldSubmitted: (value) {
                  email = value;
                },
                validator: (value) {
                  return UIValidator.validateEmail(value);
                },
              ),
              RoundedPasswordField(
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  password = value;
                },
                validator: (value) {
                  return UIValidator.validatePassword(value);
                },
              ),
              RoundedPasswordField(
                hintText: "Confirm Password",
                validator: (value) {
                  return UIValidator.validateConfirmPassword(value, password);
                },
              ),
              RoundedButton(
                  text: "SIGN UP",
                  press: () async {
                    if (_formKey.currentState!.validate() == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegisterFuture(
                              future: context
                                  .read<UserManager>()
                                  .registerNewUser(
                                      UserModel.attributes(
                                          firstName: firstName,
                                          lastName: lastName,
                                          phoneNumber: phoneNumber,
                                          userType: userType,
                                          email: email),
                                      password),
                            ),
                          ));
                    }
                  }),
              LoginRegisterLink(
                  isLoginPage: false,
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}

class RegisterFuture extends StatelessWidget {
  const RegisterFuture({
    super.key,
    required this.future,
  });

  final Future future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (_, snap) {
          Widget widget = const RegisterScreen();
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasError) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                var error = snap.error as UserDataException;

                Messenger.showSnackBar(
                    message: error.errorMessage, context: context);
              });
            } else {
              // send user to home screen
              widget = const HomeScreen();
              //message to confirm user has been registered
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Messenger.showSnackBar(
                    message: "Hurray! You are registered", context: context);
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
