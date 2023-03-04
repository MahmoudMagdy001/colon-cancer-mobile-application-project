import 'package:flutter/material.dart';

void navigatePushReplacementTo(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));
