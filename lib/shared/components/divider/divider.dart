// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;

  CustomDivider({
    this.height = 1.0,
    this.thickness = 1.0,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: thickness,
            color: color,
          ),
        ),
      ),
    );
  }
}
