import 'package:blog_app_task/base/base_repo.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterRepo extends BaseRepo {
  Future<dynamic> registerUser(
      {required BuildContext context, required String email, required String password});

  Future<dynamic> saveRegisterationData({required BuildContext context,required String firstName,
  required String lastName, required String email, required String password});
}