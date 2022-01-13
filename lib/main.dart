import 'package:blog_app_task/base/base_repo.dart';
import 'package:blog_app_task/data/app_database.dart';
import 'package:blog_app_task/data/repositories/add_post/add_post_repo.dart';
import 'package:blog_app_task/data/repositories/add_post/add_post_repo_imp.dart';
import 'package:blog_app_task/data/repositories/forgot/forgot_repo.dart';
import 'package:blog_app_task/data/repositories/forgot/forgot_repo_imp.dart';
import 'package:blog_app_task/data/repositories/home/home_repo_imp.dart';
import 'package:blog_app_task/data/repositories/login/login_repo.dart';
import 'package:blog_app_task/data/repositories/login/login_repo_imp.dart';
import 'package:blog_app_task/data/repositories/register/register_repo.dart';
import 'package:blog_app_task/data/repositories/register/register_repo_imp.dart';
import 'package:blog_app_task/data/repositories/update_post/update_repo.dart';
import 'package:blog_app_task/data/repositories/update_post/update_repo_imp.dart';
import 'package:blog_app_task/routeGenerator.dart';
import 'package:blog_app_task/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/home/home_repo.dart';

main() async {
  GetIt.I.registerSingletonAsync(() => BaseRepo.initDB());
  GetIt.I.registerSingletonWithDependencies<AddPostRepo>(() => AddPostRepoImp(),
      dependsOn: [AppDatabase]);
  GetIt.I.registerSingletonWithDependencies<HomeRepo>(() => HomeRepoImp(),
      dependsOn: [AppDatabase]);
  GetIt.I.registerSingletonWithDependencies<LoginRepo>(() => LoginRepoImp(),
      dependsOn: [AppDatabase]);
  GetIt.I.registerSingletonWithDependencies<RegisterRepo>(
      () => RegisterRepoImp(),
      dependsOn: [AppDatabase]);
  GetIt.I.registerSingletonWithDependencies<UpdateRepo>(() => UpdateRepoImp(),
      dependsOn: [AppDatabase]);
  GetIt.I.registerSingletonWithDependencies<ForgotRepo>(() => ForgotRepoImp(),
      dependsOn: [AppDatabase]);
  runApp(MaterialApp(
      onGenerateRoute: RouteGenerator, initialRoute: SplashScreen.routeName));
}
