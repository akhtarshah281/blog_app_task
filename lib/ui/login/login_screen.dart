import 'package:blog_app_task/ui/login/login_vm.dart';
import 'package:blog_app_task/utils/app_colors.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/assets.dart';
import 'package:blog_app_task/utils/screen_dimensions.dart';
import 'package:blog_app_task/widgets/status_bar_color.dart';
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
    return Consumer<LoginVM>(builder: (context, vm, _) {
      return annotatedRegion(
          AppColors.MAROON,
          Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: getScreenWidth(context),
                  height: 50,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10))),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              AppColors.MAROON)),
                      onPressed: vm.isLoading
                          ? null
                          : () => vm.validateUser(context: context),
                      child: vm.isLoading
                          ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                            AlwaysStoppedAnimation<Color>(
                                Colors.amberAccent),
                          ))
                          : Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.WHITE),
                      )),
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: getScreenWidth(context),
              height: getScreenHeight(context),
              // decoration: BoxDecoration(
              //   color: AppColors.GRADIENT_BOTTOM,
              //   image: DecorationImage(
              //       image: AssetImage(Assets.watchBg), fit: BoxFit.cover),
              // ),
              child: SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: getScreenWidth(context) / 4.25,
                              backgroundColor: AppColors.WHITE,
                              child: Image.asset(
                                Assets.loginLogo,
                                width: getScreenWidth(context) / 3.25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getScreenHeight(context) / 10,
                          ),

                          Text(
                            'Email',
                            style: TextStyle(color: AppColors.WHITE),
                          ),
                          SizedBox(
                            height: getScreenHeight(context) / 124,
                          ),
                          TextField(
                            controller: vm.emailController,
                            decoration: InputDecoration(
                                fillColor: AppColors.WHITE,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: AppColors.GREY)),
                                hintText: 'Email'),
                          ),
                          SizedBox(
                            height: getScreenHeight(context) / 50,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(color: AppColors.WHITE),
                          ),
                          SizedBox(
                            height: getScreenHeight(context) / 124,
                          ),
                          TextField(
                            controller: vm.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: AppColors.WHITE,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              hintText: 'Password',
                              // labelStyle: TextStyle(
                              //     color: Colors.amberAccent,
                              //     fontWeight: FontWeight.bold)
                            ),
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {

                                },
                                child: Text('Dont have an Account! Sign Up')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
