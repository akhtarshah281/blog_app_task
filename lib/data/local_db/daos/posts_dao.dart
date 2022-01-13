import 'package:blog_app_task/data/local_db/entities/posts_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PostsDao{

  @Query('SELECT * FROM PostEntity')
  Future<List<PostsEntity>> findAllPosts();

  @Query('SELECT * FROM PostEntity WHERE id = :id')
  Stream<PostsEntity?> findPostById(int id);

  @insert
  Future<void> insertPosts(PostsEntity food);

  @Query('DELETE FROM PostEntity WHERE id = :id')
  Future<void> deletePost(int id);
}
