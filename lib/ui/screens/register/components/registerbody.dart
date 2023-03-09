import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
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
              const AvatarPane(),
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
                      Widget widget = const RegisterScreen();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FutureBuilder(
                                future:
                                    context.read<UserManager>().registerNewUser(
                                          UserModel.attributes(
                                              firstName: firstName,
                                              lastName: lastName,
                                              phoneNumber: phoneNumber,
                                              userType: userType,
                                              email: email),
                                          password,
                                        ),
                                builder: (_, snap) {
                                  if (snap.connectionState ==
                                      ConnectionState.waiting) {
                                    widget = const LoadingScreen();
                                  } else if (snap.connectionState ==
                                      ConnectionState.done) {
                                    //message to confirm user has been registered
                                    SchedulerBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      Messenger.showSnackBar(
                                          message:
                                              "Hurray $firstName! You are registered",
                                          context: context);
                                    });

                                    // send user to home screen
                                    widget = const HomeScreen();
                                  } else if (snap.hasError) {
                                    SchedulerBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      Messenger.showSnackBar(
                                          message: "message", context: context);
                                    });
                                  } else {
                                    SchedulerBinding.instance
                                        .addPostFrameCallback((timeStamp) {
                                      Messenger.showSnackBar(
                                          message: "Something went wrong",
                                          context: context);
                                    });
                                  }

                                  return widget;
                                }),
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

class AvatarPane extends StatefulWidget {
  const AvatarPane({super.key});

  @override
  State<AvatarPane> createState() => _AvatarPaneState();
}

class _AvatarPaneState extends State<AvatarPane> {
  final _avatarPaths = [
    "assets/icons/s1.png",
    "assets/icons/s2.png",
    "assets/icons/s3.png",
    "assets/icons/s4.png",
    "assets/icons/s5.png",
    "assets/icons/s6.png",
  ];
  final List<String> _labels = [
    "Saver",
    "Investor",
    "Frugal",
    "Tightwad",
    "Thrifty",
    "Budgetor",
  ];

//   Thrifty – Someone who saves and spends money carefully.
// Frugal – A person who is economical with money and avoids waste.
// Tightwad – A person who is excessively unwilling to spend money.
// Hoarder – Someone who saves and accumulates items, including money, beyond what is necessary.
// Saver – A person who regularly saves money.
// Investor – A person who puts money into investments with the expectation of making a profit.
// Penny-pincher – A person who is very careful with their money and tries to save as much as possible.
// Budgeter – A person who creates and follows a budget to manage their money.

  late String _middleAvatarPath;
  late String _middleAvatarLabel;

  @override
  void initState() {
    super.initState();
    _middleAvatarPath = _avatarPaths[0];
    userType = _middleAvatarLabel = _labels[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () {
          BottomSheetLayout.showModalSheet(
            context: context,
            maxHeight: size.height * 0.25,
            header: "Choose Avatar",
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _avatarPaths.length,
                itemBuilder: (context, index) => Avatar(
                      onTap: () {
                        setState(() {
                          _middleAvatarPath = _avatarPaths[index];
                          userType = _middleAvatarLabel = _labels[index];
                        });
                        Navigator.pop(context);

                        Messenger.showSnackBar(
                            message: "Avatar Updated", context: context);
                      },
                      assetName: _avatarPaths[index],
                      label: _labels[index],
                      radius: size.height * 0.05,
                      scale: size.height * 0.01,
                    )),
          );
        },
        child: Avatar(
          assetName: _middleAvatarPath,
          label: _middleAvatarLabel,
          radius: size.height * 0.05,
          scale: size.height * 0.01,
        ),
      ),
    );
  }
}
