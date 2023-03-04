// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ReusableBottomSheet extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final double elevation;
  final bool isScrollControlled;
  final bool enableDrag;
  final bool isDismissible;

  ReusableBottomSheet({
    required this.child,
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
    ),
    this.elevation = 8.0,
    this.isScrollControlled = false,
    this.enableDrag = true,
    this.isDismissible = true,
  });

  @override
  _ReusableBottomSheetState createState() => _ReusableBottomSheetState();
}

class _ReusableBottomSheetState extends State<ReusableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDismissible
          ? () {
              Navigator.pop(context);
            }
          : null,
      child: Container(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
