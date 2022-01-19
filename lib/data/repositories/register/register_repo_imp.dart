import 'package:blog_app_task/data/repositories/register/register_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterRepoImp extends RegisterRepo{


  @override
  Future registerUser({required BuildContext context, required String email, required String password}) async {
    return await apiClient.registerUser(context: context, email: email, password: password);
  }


}