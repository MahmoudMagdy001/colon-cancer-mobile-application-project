import 'package:flutter/material.dart';

Text defaultText({
  required String text,
  final FontWeight? fontWeight,
  final double? fontSize,
  required Color? color,
  final TextAlign? textAlign,
}) =>
    Text(
      textAlign: textAlign,
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
