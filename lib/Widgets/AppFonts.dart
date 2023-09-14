import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppFont extends StatelessWidget {
  AppFont({super.key, this.text, this.fontSize, this.fontColor, this.isBold});

  String? text;
  double? fontSize;
  Color? fontColor;
  bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: GoogleFonts.rubik(
        fontFeatures: [const FontFeature.proportionalFigures()],
        color: fontColor ?? Colors.black,
        fontSize: fontSize ?? 10,
        fontWeight: isBold == null ? FontWeight.normal : FontWeight.bold,
      ),
    );
  }
}
