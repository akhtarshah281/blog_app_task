import 'package:blog_app_task/data/repositories/login/login_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginRepoImp extends LoginRepo{
  @override
  Future loginUser({required BuildContext context, required String email, required String password}) async {
    return await apiClient.loginUser(context: context, email: email, password: password);
  }

}