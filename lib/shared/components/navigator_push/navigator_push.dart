import 'package:flutter/material.dart';

void navigatePushTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
