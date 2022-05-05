class UserData {
  String? email;
  String? phone;
  //String? password;
  //String? uid;
  //bool? isLogin;

  UserData({
    this.email,
    this.phone,
    /*
     this.uid,
     this.password, this.isLogin*/
  });

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    //password = json['password'];
    //uid = json['uid'];
    //isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    //data['password'] = password;
    //data['uid'] = uid;
    //data['isLogin'] = isLogin;

    return data;
  }
}
