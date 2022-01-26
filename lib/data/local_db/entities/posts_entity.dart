import 'package:floor/floor.dart';

@entity
class PostsEntity {
  @primaryKey
  final String id;
  final String title;
  final String desc;
  final String imageURL;

  PostsEntity({required this.id, required this.title, required this.desc, required this.imageURL});
}
