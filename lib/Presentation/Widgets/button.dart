import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? width;
  final double? border;
  final double? borderRadius;
  final double? height;
  final double? elevation;
  final VoidCallback? onTap;
  final Color? textColor;

  const CustomButton({
    Key? key,
    this.border,
    this.textStyle,
    this.borderRadius,
    this.backgroundColor,
    this.height,
    this.width,
    this.text,
    this.elevation,
    this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(borderRadius!)),
      child: MaterialButton(
        height: height,
        minWidth: width,
        onPressed: onTap,
        elevation: elevation,
        textColor: textColor,
        child: text,
      ),
    );
  }
}
