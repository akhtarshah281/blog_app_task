import 'package:blog_app_task/base/base_vm.dart';
import 'package:blog_app_task/data/repositories/login/login_repo.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/functions.dart';
import 'package:blog_app_task/utils/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginVM extends BaseVm {
  LoginRepo repo = GetIt.I.get<LoginRepo>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void validateUser({required BuildContext context}) async {
    String getEmail = emailController.text.trim();
    String getPass = passwordController.text.trim();
    if (getEmail.isEmpty) {
      Message.error('please enter an email');
    } else if (getPass.isEmpty) {
      Message.error('password is empty');
    } else {
      await loginUser(context: context, email: getEmail, password: getPass);
    }
  }

  Future<void> loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    isLoading = true;
    dynamic response = await repo.loginUser(
        context: context, email: email, password: password);
    if (response is UserCredential) {
      isLoading = false;
      Functions.toNextScreen(
          context: context, routeName: AppConstants.homeRoute);
    }
    isLoading =false;
  }
}
