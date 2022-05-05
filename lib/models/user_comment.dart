class UserComment {
  String? uid;
  String? comment;

  UserComment({this.comment, this.uid});

  UserComment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['comment'] = comment;

    return data;
  }
}
