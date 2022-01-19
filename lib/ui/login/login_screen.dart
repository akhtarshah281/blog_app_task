import 'package:blog_app_task/utils/app_colors.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/assets.dart';
import 'package:blog_app_task/utils/functions.dart';
import 'package:blog_app_task/utils/screen_dimensions.dart';
import 'package:blog_app_task/widgets/app_text.dart';
import 'package:blog_app_task/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = AppConstants.loginRoute;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, vm, _) => Scaffold(
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: getScreenWidth(context),
                height: getScreenHeight(context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.watchBg), fit: BoxFit.cover)),
                child: SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Image.asset(
                              Assets.loginLogo,
                              width: getScreenWidth(context) / 4.25,
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  fillColor: AppColors.WHITE,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: AppColors.GREY)),
                                  labelText: 'Email'),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 44,
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: AppColors.WHITE,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: AppColors.GREY)),
                                  labelText: 'Password'),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 90,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot Password?')),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 10,
                            ),
                            SizedBox(
                              width: getScreenWidth(context) / 2,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.MAROON)),
                                  onPressed: () {},
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 23, color: AppColors.WHITE),
                                  )),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 80,
                            ),
                            SizedBox(
                              width: getScreenWidth(context) / 2,
                              child: TextButton(
                                  onPressed: () {
                                    Functions.toNextScreen(
                                        context: context,
                                        routeName: AppConstants.registerRoute);
                                  },
                                  child: Text(
                                    'Dont have an Account! Sign Up',
                                    style: TextStyle(),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
