import 'package:flutter_app/models/user_comment.dart';
import 'package:flutter_app/models/user_like.dart';

class Post {
  List<UserLike>? likes;
  List<UserComment>? comments;

  Post({this.comments, this.likes});

  Post.fromJson(Map<String, dynamic> json) {
    if (json['likes'] != null) {
      comments = <UserComment>[];
      json['likes'].forEach((v) {
        comments!.add(UserComment.fromJson(v));
      });
    }

    if (json['comments'] != null) {
      comments = <UserComment>[];
      json['comments'].forEach((v) {
        comments!.add(UserComment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (likes != null) {
      data['likes'] = comments!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
