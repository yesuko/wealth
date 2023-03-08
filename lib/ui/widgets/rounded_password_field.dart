import 'package:flutter/material.dart';
import 'package:wealth/util.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? Function(String?) validator;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final String hintText;
  final double? scale;

  const RoundedPasswordField({
    this.onFieldSubmitted,
    this.onChanged,
    this.hintText = "Password",
    required this.validator,
    this.scale,
    Key? key,
    this.onSaved,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      scale: widget.scale,
      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        onSaved: widget.onSaved,
        cursorColor: kPrimaryColorAccent,
        decoration: InputDecoration(
          hintText: widget.hintText,
          isCollapsed: false,
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColorAccent,
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() => obscureText = !obscureText),
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColorAccent,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
