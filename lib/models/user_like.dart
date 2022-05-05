class UserLike {
  String? uid;
  //bool? isLike;

  UserLike({
    this.uid,
    /*this.isLike*/
  });

  UserLike.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    //isLike = json['isLike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    //data['isLike'] = isLike;

    return data;
  }
}
