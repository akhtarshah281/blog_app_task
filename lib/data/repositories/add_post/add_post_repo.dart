import 'dart:io';

import 'package:blog_app_task/base/base_repo.dart';
import 'package:flutter/material.dart';

abstract class AddPostRepo extends BaseRepo{

  Future<dynamic> addPostData({required BuildContext context, required String title, required String description,required String ImageUrl});
  Future<dynamic> uploadPostsImage({required BuildContext context,required File file});
}