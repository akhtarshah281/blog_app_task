import 'dart:async';
import 'package:blog_app_task/data/local_db/daos/posts_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entities/posts_entity.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [PostsEntity])
abstract class AppDatabase extends FloorDatabase {
  PostsDao get postsDao;
}