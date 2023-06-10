import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.backGroundColor,
    required this.fontColor,
    required this.text,
    this.borderRadius,
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  final Color backGroundColor;
  final Color fontColor;
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          text,
          style: StyleManager.titleStyle18.copyWith(
            color: fontColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
