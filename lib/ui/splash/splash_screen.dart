import 'dart:async';

import 'package:blog_app_task/ui/login/login_screen.dart';
import 'package:blog_app_task/utils/remote_config/app_colors.dart';
import 'package:blog_app_task/utils/remote_config/app_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = AppConstants.splashRoute;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushNamed(LoginScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.MAROON,
      body: Center(child: Text('This is Splash Screen'),),
    );
  }
}
