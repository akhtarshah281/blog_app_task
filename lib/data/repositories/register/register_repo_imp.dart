import 'package:blog_app_task/data/repositories/register/register_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterRepoImp extends RegisterRepo {
  @override
  Future registerUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    return await apiClient.registerUser(
        context: context, email: email, password: password);
  }

  @override
  Future saveRegisterationData(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    return await apiClient.saveRegisterationData(
        context: context,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
  }
}
