import 'package:blog_app_task/ui/add_post/add_post_screen.dart';
import 'package:blog_app_task/ui/add_post/add_post_vm.dart';
import 'package:blog_app_task/ui/forgot_pass/forgot_screen.dart';
import 'package:blog_app_task/ui/forgot_pass/forgot_vm.dart';
import 'package:blog_app_task/ui/home/home_screen.dart';
import 'package:blog_app_task/ui/home/home_vm.dart';
import 'package:blog_app_task/ui/login/login_screen.dart';
import 'package:blog_app_task/ui/login/login_vm.dart';
import 'package:blog_app_task/ui/register/register_screen.dart';
import 'package:blog_app_task/ui/register/register_vm.dart';
import 'package:blog_app_task/ui/splash/splash_screen.dart';
import 'package:blog_app_task/ui/splash/splash_vm.dart';
import 'package:blog_app_task/ui/update_profile/update_screen.dart';
import 'package:blog_app_task/ui/update_profile/update_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<MaterialPageRoute> RouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => SplashVM(),
                child: SplashScreen(),
              ));
    case LoginScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => LoginVM(), child: LoginScreen()));
    case RegisterScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => RegisterVM(),
                child: RegisterScreen(),
              ));
    case ForgotScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => ForgotVM(),
                child: ForgotScreen(),
              ));
    case UpdateScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => UpdateProfileVM(),
                child: UpdateScreen(),
              ));
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => HomeVM(context),
                child: HomeScreen(),
              ));
    case AddPostScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => AddPostVM(),
                child: AddPostScreen(),
              ));
    default:
      return MaterialPageRoute(builder: (context) => ErrorRoute());
  }
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('this is Error Route'),
      ),
    );
  }
}
