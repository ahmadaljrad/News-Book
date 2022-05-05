import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/shared/authentication_helper.dart';
import 'package:flutter_app/models/user_data.dart';

class ResponseData {
  bool status;
  dynamic result;
  ResponseData({required this.status, required this.result});
}

class FirebaseMethos {
  static String _getAppErrorType(String error) {
    if (error.contains("fetchUserData")) {
      return "N1";
    } else if (error.contains("userRegister")) {
      return "N2";
    }
    return "404";
  }

  static Future fetchUserData(String email, String password) async {
    ResponseData res = ResponseData(
        status: false,
        result: "APP Error: ${_getAppErrorType('fetchUserData')}");
    String val =
        AuthenticationHelper.returnVisibility(email: email, password: password);

    if (val.isNotEmpty) {
      res = ResponseData(status: false, result: val);
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          res = ResponseData(status: true, result: value);
        });
      } on FirebaseException catch (e) {
        String error = e.code.toString().toLowerCase().contains("unknown")
            ? "check your connection and try again"
            : e.code;
        res = ResponseData(status: false, result: error);
      }
    }
    return res;
  }

  static userRegister(
      {required String email,
      required String password,
      required String confiremPassword,
      required String phone}) async {
    UserData userData = UserData(
      email: email,
      //password: password,
      phone: phone,
      //isLogin: false,
    );
    ResponseData res = ResponseData(
        status: false,
        result: "APP Error: ${_getAppErrorType('userRegister')}");
    String val = AuthenticationHelper.returnVisibility(
      email: email,
      password: password,
      confiremPassword: confiremPassword,
      phone: phone,
    );

    if (val.isNotEmpty) {
      res = ResponseData(status: false, result: val);
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          userCreate(
            data: userData.toJson(),
            uid: value.user?.uid.toString(),
          );
          res = ResponseData(status: true, result: value);
        });
      } on FirebaseException catch (e) {
        String error = e.code.toString().toLowerCase().contains("unknown")
            ? "check your connection and try again"
            : e.code;
        res = ResponseData(status: false, result: error);
      }
    }

    return res;
  }

  static userCreate({required data, required uid}) async {
    await FirebaseFirestore.instance
        .collection("userInfo")
        .doc(uid)
        .set(data)
        .then((value) => "")
        .catchError((e) => e.toString());
  }

  static Future<bool> checkEmailVerified({required data}) async {
    bool isEmailVerified = false;
    isEmailVerified = await data.result.user!.emailVerified;
    return isEmailVerified;
  }

/*
  static Future<bool> userIsLogin({required uid}) async {
    var collection = FirebaseFirestore.instance.collection('userInfo');
    var querySnapshot = await collection.doc(uid).get();
    Map<String, dynamic>? json = querySnapshot.data();
    UserData data = UserData.fromJson(json!);

    //isLogin is false in DB by first login
    if (!data.isLogin!) {
      data.isLogin = true;
      await FirebaseFirestore.instance
          .collection("userInfo")
          .doc(uid)
          .set(data.toJson());
      return false;
    } else {
      return true;
    }
  }

  static userIsLogOut({required uid}) async {
    var collection = FirebaseFirestore.instance.collection('userInfo');
    var querySnapshot = await collection.doc(uid).get();
    Map<String, dynamic>? json = querySnapshot.data();
    UserData data = UserData.fromJson(json!);
    data.isLogin = false;
    await FirebaseFirestore.instance
        .collection("userInfo")
        .doc(uid)
        .set(data.toJson());
  }
*/
  static resetPassword(String email) async {
    if (email.isEmpty) {
      //await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
}
