import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wealth/util.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  final double? scale;
  final bool centerText;
  final Color? color;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final int? maxLines;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final double? iconSize;
  final double? marginHeight;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const RoundedInputField({
    required this.hintText,
    this.iconData = Icons.person,
    this.onChanged,
    this.validator,
    this.centerText = false,
    this.scale,
    this.initialValue,
    this.keyboardType,
    this.textCapitalization,
    this.maxLines,
    Key? key,
    this.color,
    this.inputFormatters,
    this.enabled,
    this.iconSize,
    this.marginHeight,
    this.onSaved,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      scale: scale,
      color: color,
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        focusNode: focusNode,
        enabled: enabled,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: kPrimaryColorAccent,
        validator: validator,
        textAlign: centerText ? TextAlign.center : TextAlign.start,
        maxLength: maxLines,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(
            iconData,
            color: kPrimaryColorAccent,
            size: iconSize ?? 24,
          ),
          hintText: hintText,
          isCollapsed: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
