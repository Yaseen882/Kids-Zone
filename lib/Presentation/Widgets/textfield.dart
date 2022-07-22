import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practise/constants.dart';

class TextFieldCustomWidget extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final bool? autoFocus;
  final bool? filled;
  final OutlineInputBorder? border;
  final OutlineInputBorder? focusBorder;
  final OutlineInputBorder? errorBorder;
  final TextStyle? hintStyle;
  final TextStyle? userTextStyle;
  final Color? cursorColor;
  final Color? fillColor;


  const TextFieldCustomWidget({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    this.inputFormatter,
    this.keyBoardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus = false,
    this.filled = false,
    this.border,
    this.focusBorder,
    this.errorBorder,
    this.hintStyle,
    this.userTextStyle,
    this.cursorColor,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: validator,
          controller: controller,
          style: userTextStyle,
          cursorColor: cursorColor,
          obscureText: obscureText!,
          inputFormatters: inputFormatter,
          decoration: InputDecoration(
            enabledBorder: border,
            focusedBorder: focusBorder,
            hintText: hintText,
            filled: filled,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: Constants.primaryColor,
            hintStyle: hintStyle,
            errorBorder: errorBorder,

          ),
        ),
      ),
    );
  }
}
