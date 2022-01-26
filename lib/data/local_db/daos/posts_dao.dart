import 'package:blog_app_task/data/local_db/entities/posts_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PostsDao{

  @Query('SELECT * FROM PostsEntity')
  Future<List<PostsEntity>> findAllPosts();

  @Query('SELECT * FROM PostsEntity WHERE id = :id')
  Stream<PostsEntity?> findPostById(int id);

  @insert
  Future<void> insertPosts(PostsEntity posts);

  @Query('DELETE FROM PostsEntity WHERE id = :id')
  Future<void> deletePost(int id);
}
