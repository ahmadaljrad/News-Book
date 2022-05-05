import 'package:hive/hive.dart';
part 'react_with_posts.g.dart';

@HiveType(typeId: 0)
class ReactWithPosts {
  ReactWithPosts(
      {required this.upReact, required this.downReact, required this.postId});

  @HiveField(0)
  int upReact;

  @HiveField(1)
  int downReact;

  @HiveField(2)
  String postId; //publishedAt

  int getUpReact() {
    return upReact;
  }

  int getDownReact() {
    return upReact;
  }

  String getPostId() {
    return postId;
  }
}
