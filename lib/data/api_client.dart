import 'package:blog_app_task/utils/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApiClient {
  Future<dynamic> registerUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    }catch(e){
      Message.error((e as FirebaseAuthException).message!);

    }
  }
}
