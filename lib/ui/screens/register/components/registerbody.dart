import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:wealth/ui/screens/login/login_screen.dart';
import 'package:wealth/ui/widgets/bottom_sheet.dart';
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
              const AvatarPane(),
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

class AvatarPane extends StatefulWidget {
  const AvatarPane({super.key});

  @override
  State<AvatarPane> createState() => _AvatarPaneState();
}

class _AvatarPaneState extends State<AvatarPane> {
  final _avatarPaths = [
    "assets/icons/s0.png",
    "assets/icons/s1.png",
    "assets/icons/s2.png",
    "assets/icons/s3.png",
    "assets/icons/s4.png",
    "assets/icons/s5.png",
    "assets/icons/s6.png",
  ];
  final List<String> _labels = [
    "Nothing",
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
    _middleAvatarLabel = "Choose Avatar";
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
            maxHeight: size.height * 0.3,
            header: "Choose Avatar",
            child: Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              height: size.height * 0.3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: _avatarPaths.length,
                  itemBuilder: (_, index) => Avatar(
                      onTap: () {
                        setState(() {
                          _middleAvatarPath = _avatarPaths[index];
                          _middleAvatarLabel = _labels[index];
                        });
                      },
                      assetName: _avatarPaths[index],
                      label: _labels[index])),
            ),
          );
        },
        child: Avatar(
          assetName: _middleAvatarPath,
          label: _middleAvatarLabel,
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar(
      {super.key, required this.assetName, required this.label, this.onTap});
  final String assetName;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.3,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kPrimaryColor),
                shape: BoxShape.circle,
              ),
              child: AvatarContainer(
                radius: size.height * 0.05,
                scale: size.height * 0.01,
                assetName: assetName,
                color: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
