import 'package:blog_app_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final bool? softWrap;
  final int? maxLines;

  PrimaryText(
    this.text, {
    this.fontSize,
    this.softWrap,
    this.textOverflow,
    this.maxLines,
    this.color = AppColors.WHITE,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style:
          TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextOverflow? textOverflow;

  CustomText(this.text, this.textStyle, {this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: textStyle,
    );
  }
}
