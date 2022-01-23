import 'package:blog_app_task/base/base_repo.dart';
import 'package:blog_app_task/data/local_db/app_database.dart';
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
import 'package:blog_app_task/ui/add_post/add_post_screen.dart';
import 'package:blog_app_task/ui/home/home_screen.dart';
import 'package:blog_app_task/ui/login/login_screen.dart';
import 'package:blog_app_task/ui/register/register_screen.dart';
import 'package:blog_app_task/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/api_client.dart';
import 'data/repositories/home/home_repo.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingletonAsync(() => BaseRepo.initDB());
  GetIt.I.registerSingleton<ApiClient>(ApiClient());
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
  await GetIt.I.allReady();
  await Firebase.initializeApp();

  runApp(MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      onGenerateRoute: RouteGenerator, initialRoute:LoginScreen.routeName));
}