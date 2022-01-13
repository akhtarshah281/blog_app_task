import 'package:blog_app_task/data/app_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BaseRepo{

AppDatabase database = GetIt.I.get<AppDatabase>();

static Future<AppDatabase> initDB()async{
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}
}