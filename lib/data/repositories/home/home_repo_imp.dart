import 'package:blog_app_task/data/repositories/home/home_repo.dart';

class HomeRepoImp extends HomeRepo{
  @override
  Future getPosts() {
    return apiClient.getPostsData();
  }

}