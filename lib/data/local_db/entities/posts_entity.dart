import 'package:floor/floor.dart';

@entity
class PostsEntity {
  @primaryKey
  final String id;
  final String title;
  final String desc;
  final String imageURL;

  PostsEntity(this.id, this.title, this.desc, this.imageURL);
}
