import 'package:blog_app_task/Models/posts_model.dart';
import 'package:blog_app_task/base/base_vm.dart';
import 'package:blog_app_task/data/local_db/entities/posts_entity.dart';
import 'package:blog_app_task/data/repositories/home/home_repo.dart';
import 'package:blog_app_task/utils/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeVM extends BaseVm {
  HomeRepo repo = GetIt.I.get<HomeRepo>();
  final BuildContext _context;
  List<PostsEntity> list = [];
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

  //check internet connectivity
  Future<void> internetCheck({required BuildContext context}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected and get data from Firebase
      Message.error('internet connected');
      await getPosts(context: context);
    } else {
      // not connected and get data from floor database
      Message.error('you are offline');
      await getCachedPosts(context: context);
    }
  }

  Future<dynamic> getPosts({required BuildContext context}) async {
    isLoading = true;
    dynamic snapshot = await repo.getPosts();
    if (snapshot is QuerySnapshot) {
      for (var documentSnapshot in (snapshot).docs) {
        list.add(
          PostsEntity(
            id: documentSnapshot.id,
            title: documentSnapshot.get('title'),
            desc: documentSnapshot.get('desc'),
            imageURL: documentSnapshot.get('imageUrl'),
          ),
        );
        //insert all data in floor database by calling insertCachedPosts function
        insertCachedPosts(
            id: documentSnapshot.id,
            title: documentSnapshot.get('title'),
            postDesc: documentSnapshot.get('desc'),
            imageUrl: documentSnapshot.get('imageUrl'));
      }
      isLoading = false;
    } else {
      isLoading = true;
    }
  }

  Future<dynamic> insertCachedPosts(
      {required String id,
      required String title,
      required String postDesc,
      required String imageUrl}) async {
    await repo.database.postsDao.insertPosts(
        PostsEntity(id: id, title: title, desc: postDesc, imageURL: imageUrl));
    notifyListeners();
  }

  Future<dynamic> getCachedPosts({required BuildContext context}) async {
    list.clear();
    list = await repo.database.postsDao.findAllPosts();
    notifyListeners();
  }
}
