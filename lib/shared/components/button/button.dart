// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../styles/colors.dart';


class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Color? color;
  final IconData? iconData;
  final double? iconsize;

  CustomButton({
    required this.label,
    required this.onPressed,
    this.color,
    this.iconData,
    this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: allColor,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 30.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (iconData != null)
            Icon(iconData, color: Colors.white, size: iconsize),
          if (iconData != null) const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato'),
          ),
        ],
      ),
    );
  }
}
