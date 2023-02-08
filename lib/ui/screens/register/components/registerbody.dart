import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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

class AvatarSlide extends StatefulWidget {
  const AvatarSlide({super.key});

  @override
  State<AvatarSlide> createState() => _AvatarSlideState();
}

class _AvatarSlideState extends State<AvatarSlide> {
  final _avatarPaths = [
    "assets/icons/s0.png",
    "assets/icons/s1.png",
    "assets/icons/s2.png",
    "assets/icons/s3.png",
    "assets/icons/s4.png",
    "assets/icons/s5.png",
    "assets/icons/s6.png",
    "assets/icons/s0.png",
  ];
  final List<String> _labels = [
    "",
    "Saver",
    "Investor",
    "Frugal",
    "Tightwad",
    "Thrifty",
    "Budgetor",
    "",
  ];

//   Thrifty – Someone who saves and spends money carefully.
// Frugal – A person who is economical with money and avoids waste.
// Tightwad – A person who is excessively unwilling to spend money.
// Hoarder – Someone who saves and accumulates items, including money, beyond what is necessary.
// Saver – A person who regularly saves money.
// Investor – A person who puts money into investments with the expectation of making a profit.
// Penny-pincher – A person who is very careful with their money and tries to save as much as possible.
// Budgeter – A person who creates and follows a budget to manage their money.

  late ScrollController _scrollController;
  String _middleAvatarPath = "assets/icons/s1.png";
  String _middleAvatarLabel = "Saver";

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final width = _scrollController.position.maxScrollExtent / 5;
      final currentPos = _scrollController.offset;
      final avatarWidth = _scrollController.position.viewportDimension;
      final middleAvatarIndex =
          ((currentPos + avatarWidth / 2) / width).floor();

      if (middleAvatarIndex != 8) {
        setState(() {
          _middleAvatarPath = _avatarPaths[middleAvatarIndex];
          _middleAvatarLabel = _labels[middleAvatarIndex];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            height: size.height * 0.2,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: _avatarPaths.length,
              itemBuilder: (_, index) => AvatarContainer(
                radius: size.height * 0.05,
                scale: size.height * 0.01,
                assetName: _avatarPaths[index],
                color: Colors.transparent,
              ),
            ),
          ),
          Container(
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
                    assetName: _middleAvatarPath,
                    color: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    _middleAvatarLabel,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
