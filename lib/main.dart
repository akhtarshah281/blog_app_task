import 'package:blog_app_task/routeGenerator.dart';
import 'package:blog_app_task/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

main () async {

  runApp(MaterialApp(onGenerateRoute: RouteGenerator,
  initialRoute: SplashScreen.routeName,));

}