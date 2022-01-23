import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget annotatedRegion(Color color,  var child) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
        statusBarColor: color),
    child: child,
  );
}