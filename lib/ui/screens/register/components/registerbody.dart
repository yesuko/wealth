import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/widgets/login_register_link.dart';
import 'package:wealth/ui/widgets/avatar_container.dart';
import 'package:wealth/ui/widgets/messenger.dart';
import 'package:wealth/ui/widgets/rounded_button.dart';
import 'package:wealth/ui/widgets/rounded_input_field.dart';
import 'package:wealth/ui/widgets/rounded_password_field.dart';
import 'package:wealth/util.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const AvatarSlide(),
              RoundedInputField(
                hintText: "First Name",
                onChanged: (value) {
                  //email = value;
                },
                validator: (_) {
                  return null; //ValidatorService.validateEmail(email);
                },
              ),
              RoundedInputField(
                hintText: "Last Name",
                onChanged: (value) {
                  //email = value;
                },
                validator: (_) {
                  return null; //ValidatorService.validateEmail(email);
                },
              ),
              RoundedInputField(
                iconData: Icons.phone_android_outlined,
                hintText: "Mobile Wallet Number",
                onChanged: (value) {
                  //email = value;
                },
                validator: (_) {
                  return null; //ValidatorService.validateEmail(email);
                },
              ),
              RoundedInputField(
                iconData: Icons.email,
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
              RoundedPasswordField(
                hintText: "Confirm Password",
                onChanged: (value) {
                  // password = value;
                },
                validator: (_) {
                  return null;
                  //ValidatorService.validatePassword(password);
                },
              ),
              RoundedButton(
                  text: "SIGN UP",
                  press: () {
                    Messenger.showSnackBar(
                        message: "Hurray! You are registered",
                        context: context);
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

class AvatarSlide extends StatelessWidget {
  const AvatarSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  AvatarContainer(
                    radius: size.height * 0.05,
                    color: Colors.red,
                  ),
                  AvatarContainer(
                    radius: size.height * 0.05,
                    color: Colors.green,
                  ),
                  AvatarContainer(
                    radius: size.height * 0.05,
                    color: Colors.blue,
                  ),
                  AvatarContainer(
                    radius: size.height * 0.05,
                    color: Colors.purple,
                  ),
                  AvatarContainer(radius: size.height * 0.05),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: size.height * 0.15,
            width: size.width * 0.3,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: kPrimaryColor),
                shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
