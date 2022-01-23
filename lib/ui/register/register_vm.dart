import 'package:blog_app_task/base/base_vm.dart';
import 'package:blog_app_task/data/repositories/register/register_repo.dart';
import 'package:blog_app_task/utils/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterVM extends BaseVm {
  RegisterRepo repo = GetIt.I.get<RegisterRepo>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void validateUser(BuildContext context) async {
    String getFirstName = firstNameController.text.trim();
    String getLastName = lastNameController.text.trim();
    String getEmail = emailController.text.trim();
    String getPassword = passwordController.text.trim();

    if (getFirstName.isEmpty) {
      Message.error('first name is empty');
    } else if (getLastName.isEmpty) {
      Message.error('last name is empty');
    } else if (getEmail.isEmpty) {
      Message.error('email is empty');
    } else if (getPassword.isEmpty) {
      Message.error('password can not be empty');
    } else {
      await registerWithEmailPassword(
          context: context, email: getEmail, password: getPassword);
      Message.success('Registered Successfully');
      await saveRegisterationData(
          context: context,
          firstName: getFirstName,
          lastName: getLastName,
          email: getEmail,
          password: getPassword);
       // Message.success('saved Data');
    }
  }

  Future<void> registerWithEmailPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    isLoading = true;
    await repo.registerUser(context: context, email: email, password: password);
    isLoading = false;
  }

  Future<void> saveRegisterationData(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    isLoading = true;
    await repo.saveRegisterationData(
        context: context,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    isLoading = false;
  }
}
