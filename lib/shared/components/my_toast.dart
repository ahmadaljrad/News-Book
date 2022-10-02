// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { ERROR, WARNING, SUCCESS, INFO }

class MyToast {
  static show({String? text, ToastState? toastState}) {
    Color color;
    switch (toastState!.index) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.amber;
        break;
      case 2:
        color = Colors.green;
        break;
      default:
        color = Colors.blue;
        break;
    }
    // var snackBar = SnackBar(
    //   content: Text(
    //     text!,
    //     style: TextStyle(color: AppColors.textWhite),
    //   ),
    //   backgroundColor: color,
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Fluttertoast.showToast(
      msg: text ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
    );
  }
}
