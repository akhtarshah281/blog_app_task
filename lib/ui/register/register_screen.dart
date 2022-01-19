import 'package:blog_app_task/ui/register/register_vm.dart';
import 'package:blog_app_task/utils/app_colors.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/assets.dart';
import 'package:blog_app_task/utils/functions.dart';
import 'package:blog_app_task/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = AppConstants.registerRoute;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterVM>(
        builder: (context, vm, _) => Scaffold(
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: getScreenWidth(context),
                height: getScreenHeight(context),
                child: SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                Assets.loginLogo,
                                width: getScreenWidth(context) / 4.25,
                              ),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 10,
                            ),
                            TextField(
                              controller: vm.firstNameController,
                              decoration: InputDecoration(
                                  fillColor: AppColors.WHITE,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: AppColors.GREY)),
                                  labelText: 'First Name'),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 44,
                            ),
                            TextField(
                              controller: vm.lastNameController,
                              decoration: InputDecoration(
                                  fillColor: AppColors.WHITE,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: AppColors.GREY)),
                                  labelText: 'Last Name'),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 90,
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
                                  labelText: 'Email'),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) / 90,
                            ),
                            TextField(
                              controller: vm.passwordController,
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
                              height: getScreenHeight(context) / 10,
                            ),
                            SizedBox(
                              width: getScreenWidth(context) / 2,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.MAROON)),
                                  onPressed: vm.isLoading
                                      ? null
                                      : () => vm.validateUser(context),
                                  child: vm.isLoading
                                      ? SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    AppColors.WHITE),
                                          ),
                                        )
                                      : Text(
                                          'Register',
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: AppColors.WHITE),
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
                                        routeName: AppConstants.loginRoute);
                                  },
                                  child: Text(
                                    'Already have an Account! Sign In',
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
