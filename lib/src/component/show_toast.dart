import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static void toast({required String? message}) {
    Future.delayed(Duration.zero, () {
      Fluttertoast.showToast(
          msg: message ?? '',
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0);
    });
  }
}
