import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  static void showShortToast(String? message) {
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepOrange,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  static void showShortToastSuccess(String? message) {
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 96, 241, 100),
        textColor: Colors.white,
        fontSize: 12.0);
  }

  static void showSnackBar(BuildContext context, String? message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(message!),
      // duration: const Duration(milliseconds: 2000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
