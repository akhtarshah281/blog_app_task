import 'dart:io';

import 'package:blog_app_task/base/base_vm.dart';
import 'package:blog_app_task/data/repositories/add_post/add_post_repo.dart';
import 'package:blog_app_task/utils/app_constants.dart';
import 'package:blog_app_task/utils/functions.dart';
import 'package:blog_app_task/utils/message.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddPostVM extends BaseVm {
  AddPostRepo repo = GetIt.I.get<AddPostRepo>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void addPost({required BuildContext context, File? file}) async {
    String getTitle = titleController.text.trim();
    String getDesc = descController.text.trim();
    if (file == null) {
      Message.error('Plz add Picture to your post');
    } else if (getTitle.isEmpty) {
      Message.error('Plz enter a title for your post');
    } else if (getDesc.isEmpty) {
      Message.error('Plz add Description to your post');
    } else {
      String? url = await uploadPostImage(context: context, file: file);
      await addPostData(
          context: context,
          title: getTitle,
          description: getDesc,
          postImageUrl: url);
    }
  }

  Future<void> addPostData(
      {required BuildContext context,
      required String title,
      required String description,
      required String postImageUrl}) async {
    isLoading = true;
    await repo.addPostData(
        context: context,
        title: title,
        description: description,
        ImageUrl: postImageUrl);
    Functions.toNextScreen(context: context, routeName: AppConstants.homeRoute);
    isLoading = false;
  }

  Future<String> uploadPostImage(
      {required BuildContext context, required File file}) async {
    isLoading = true;
    String url = await repo.uploadPostsImage(context: context, file: file);
    isLoading = false;
    return url;
  }
}
