import 'package:flutter/material.dart';

class Functions{


  static void toNextScreen({required BuildContext context,required String routeName}){
    Navigator.pushNamed(context, routeName);
  }
}