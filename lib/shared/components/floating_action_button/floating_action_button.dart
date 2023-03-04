// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../styles/colors.dart';


class CustomFAB extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  CustomFAB({
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: allColor,
      child: Icon(iconData),
    );
  }
}
