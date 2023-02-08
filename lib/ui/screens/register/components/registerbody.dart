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
  final List<Color> _colors = [
    Colors.transparent,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.transparent,
  ];

  late ScrollController _scrollController;
  Color _middleAvatarColor = Colors.yellow;
  //String _middleAvatarLabel =

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final width = _scrollController.position.maxScrollExtent / 4;
      final currentPos = _scrollController.offset;
      final avatarWidth = _scrollController.position.viewportDimension;
      final middleAvatarIndex =
          ((currentPos + avatarWidth / 2) / width).floor();

      if (middleAvatarIndex != 6) {
        setState(() {
          _middleAvatarColor = _colors[middleAvatarIndex];
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
            height: size.height * 0.2,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: _colors.length,
              itemBuilder: (_, index) => AvatarContainer(
                radius: size.height * 0.05,
                color: _colors[index],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: size.height * 0.15,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              color: _middleAvatarColor,
              border: Border.all(color: kPrimaryColor),
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
