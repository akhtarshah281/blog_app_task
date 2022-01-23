import 'package:blog_app_task/Models/posts_model.dart';
import 'package:blog_app_task/base/base_vm.dart';
import 'package:blog_app_task/data/repositories/home/home_repo.dart';
import 'package:blog_app_task/utils/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeVM extends BaseVm{
  HomeRepo repo = GetIt.I.get<HomeRepo>();
  final BuildContext _context;
  List<PostsModel> dataList = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
// Constructor
  HomeVM(this._context) {
    internetCheck(context: _context);
  }

  Future<void> internetCheck({required BuildContext context}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected and get data from Firebase
      getPosts(context: context);
    } else {
      // not connected and get data from floor database
      // getCachedPosts();
      Message.error('offline Data Added');
    }
  }
  Future<dynamic> getPosts({required BuildContext context}) async {
    isLoading = true;
    dynamic snapshot = await repo.getPosts();
    if (snapshot is QuerySnapshot) {
      for (var documentSnapshot in (snapshot).docs) {
        dataList.add(
          PostsModel(
            id: documentSnapshot.id,
            title: documentSnapshot.get('title'),
            desc: documentSnapshot.get('desc'),
            imageUrl: documentSnapshot.get('imageUrl'),
          ),
        );
        // PostsModel model = GetIt.instance.get<PostsModel>();
        //insert all data in floor database
        // insertCachedPosts(
        //     id: documentSnapshot.id, title: documentSnapshot.get('title'), postDesc: documentSnapshot.get('desc'), imageUrl: documentSnapshot.get('imageUrl'));
        //
      }
      isLoading = false;

    } else {
      isLoading = true;
    }
  }

}