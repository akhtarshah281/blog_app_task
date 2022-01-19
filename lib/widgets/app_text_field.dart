import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  bool? obsecureText;
  final bool? isPassword;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();

  AppTextField(
      {required this.label,
      required this.hint,
      this.controller,
      this.inputType,
      this.obsecureText,
      this.isPassword,
      this.textInputAction,
      this.onSubmitted,
      this.focusNode});
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: widget.textInputAction,
      obscureText: widget.obsecureText!,
      decoration: InputDecoration(label: Text(widget.label)),
    );
  }
}
