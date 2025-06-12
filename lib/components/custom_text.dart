import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.black,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: decorationColor,
      ),
    );
  }
}
