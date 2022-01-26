import 'package:blog_app_task/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget appBar({String? text, Color? color}) {
  return AppBar(
    backgroundColor:color,
    title: Text(
      text!,
    ),
    centerTitle: true,
    // leading: IconButton(icon: iconButton!, onPressed: () {}),
  );
}
